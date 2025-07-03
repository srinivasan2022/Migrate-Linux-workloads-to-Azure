
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