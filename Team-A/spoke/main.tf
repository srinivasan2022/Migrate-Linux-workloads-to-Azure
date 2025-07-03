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

module "postgres" {
  for_each = var.postgres_servers
 
  source               = "../../modules/postgres-sql"
  name                 = each.key
  location             = data.azurerm_resource_group.rg.location
  resource_group_name  = data.azurerm_resource_group.rg.name
  admin_username       = each.value.admin_username
  admin_password       = each.value.admin_password
  subnet_id            = module.virtual-network.subnets["postgresql"].id
  depends_on = [ module.virtual-network ]
  
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
}