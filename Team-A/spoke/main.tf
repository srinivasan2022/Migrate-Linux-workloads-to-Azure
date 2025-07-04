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

data "azurerm_virtual_network" "hub" {
  name                = "vnet-hub"
  resource_group_name = data.azurerm_resource_group.rg.name
  
}

module "spoke-hub-peering" {
  source = "../../modules/vnet-peering"
  peering_name = "spoke-hub-peering"
  source_resource_group = data.azurerm_resource_group.rg.name
  source_vnet_name = module.virtual-network.vnet_name
  target_vnet_id = data.azurerm_virtual_network.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = false
  use_remote_gateways = true
  depends_on = [ data.azurerm_resource_group.rg , module.virtual-network , data.azurerm_virtual_network.hub ]
}

module "hub-spoke-peering" {
  source = "../../modules/vnet-peering"
  peering_name = "hub-spoke-peering"
  source_resource_group = data.azurerm_resource_group.rg.name
  source_vnet_name = data.azurerm_virtual_network.hub.name
  target_vnet_id = module.virtual-network.vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = true
  use_remote_gateways = false
  depends_on = [ data.azurerm_resource_group.rg , module.virtual-network , data.azurerm_virtual_network.hub ]
}

module "postgres" {
  for_each = var.postgres_servers
 
  source               = "../../modules/postgres-sql"
  name                 = each.key
  location             = data.azurerm_resource_group.rg.location
  resource_group_name  = data.azurerm_resource_group.rg.name
  admin_username       = each.value.admin_username
  admin_password       = each.value.admin_password
  subnet_id            = module.virtual-network.subnets["postgresql"].id
  depends_on = [  data.azurerm_resource_group.rg , module.virtual-network ]
  
}

module "pg_private_access" {
  source = "../../modules/private-endpoint"
 
  name                          = var.pv-name
  location                      = data.azurerm_resource_group.rg.location
  resource_group_name           = data.azurerm_resource_group.rg.name
  private_dns_zone_name         = "privatelink.postgres.database.azure.com"
  vnet_id                       = module.virtual-network.vnet_id
  private_endpoint_subnet_id    = module.virtual-network.subnets["postgresql"].id
  private_connection_resource_id = module.postgres["pgserver-linux"].id
  subresource_name              = "postgresqlServer"
  depends_on = [ data.azurerm_resource_group.rg , module.virtual-network , module.postgres ]
}