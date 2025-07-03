
terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}
 
provider "azurerm" {
  features {}
}
 

data "azurerm_resource_group" "rg" {
  name = "rg-hub-spoke"
 
}

module "virtual-network" {
  source              = "../../modules/virtualnetwork"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnets             = var.subnets
  depends_on = [ data.azurerm_resource_group.rg ]
}

module "public_ip" {
  source = "../../modules/public-ip"
  for_each = var.public_ip
  name                = each.value.name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
  depends_on = [ data.azurerm_resource_group.rg ]
}



module "gateway" {
  source = "../../modules/gateway"
  for_each = var.VpnGW
  name = each.key
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  gateway_subnet_id = module.virtual-network.subnet_ids["GatewaySubnet"]
  private_ip_address_allocation =each.value.private_ip_address_allocation
  ip_config_name = each.value.ip_config_name
  public_ip_id = module.public_ip["GatewaySubnet"].id

  depends_on = [ data.azurerm_resource_group.rg,module.public_ip,module.virtual-network ]
  
}

data "azurerm_virtual_network" "onprem" {
  name = "vnet-onpremises"
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_public_ip" "onprem-gw" {
  name = "public-ip-gateway"
  resource_group_name = data.azurerm_resource_group.rg.name
}
module "local-network-onprem-gw" {
  source = "../../modules/local-network-gw"
  name = "on-prem-lgw"
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  gateway_address = data.azurerm_public_ip.onprem-gw.ip_address
  address_space = [data.azurerm_virtual_network.onprem.address_space[0]]

  depends_on = [ data.azurerm_resource_group.rg,data.azurerm_virtual_network.onprem, data.azurerm_public_ip.onprem-gw ]
}

module "local-network-hub-gw" {
  source = "../../modules/local-network-gw"
  name = "hub-lgw"
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  gateway_address = module.public_ip["GatewaySubnet"].ip_address
  address_space = [module.virtual-network.vnet_address_space[0]]

  depends_on = [ data.azurerm_resource_group.rg,module.virtual-network, module.public_ip ]
}

data "azurerm_virtual_network_gateway" "hub-gateway" {
  name = "on-prem-gw"
  resource_group_name = data.azurerm_resource_group.rg.name
}
module "vpn-connection-onprem-hub" {
  source = "../../modules/vpn-connection"
  name = "onprem-hub-vpn-connection"
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  local_gateway_id = module.local-network-onprem-gw.local_gateway_id
  vnet_gateway_id = data.azurerm_virtual_network_gateway.hub-gateway.id
  shared_key = var.admin_password

  depends_on = [ data.azurerm_resource_group.rg, module.local-network-onprem-gw, data.azurerm_virtual_network_gateway.hub-gateway ]
}

module "vpn-connection-hub-onprem" {
  source = "../../modules/vpn-connection"
  name = "hub-onprem-vpn-connection"
  location = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  local_gateway_id = module.local-network-hub-gw.local_gateway_id
  vnet_gateway_id = module.gateway["hub-vpngw"].vpn_gateway_id
  shared_key = var.admin_password

  depends_on = [ data.azurerm_resource_group.rg, module.local-network-hub-gw,module.gateway ]
}