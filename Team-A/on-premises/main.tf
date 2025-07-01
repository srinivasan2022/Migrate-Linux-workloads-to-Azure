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
 

module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.resource_group_location
 
}

module "virtual_network" {
  source              = "./modules/virtualnetwork"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnets             = var.subnets
}

# module "linux_vm" {
#   source              = "./modules/linuxvm"
#   resource_group_name = module.resource_group.resource_group_name
#   location            = module.resource_group.resource_group_location
#   vm_name             = var.vm_name
#   subnet_id           = module.virtual_network.subnet_ids
#   admin_username      = var.admin_username
#   admin_ssh_key       = var.admin_ssh_key
  
# }
