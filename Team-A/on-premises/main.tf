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
 

module "resource-group" {
  source   = "../../modules/resource-group"
  name     = var.resource_group_name
  location = var.resource_group_location
 
}

module "virtual-network" {
  source              = "../../modules/virtualnetwork"
  resource_group_name = module.resource-group.resource_group_name
  location            = module.resource-group.resource_group_location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  subnets             = var.subnets
  depends_on = [ module.resource-group ]
}

# module "public_ip" {
#   source = "./modules/public_ip"
#   for_each = var.public_ip
#   name                = each.value.name
#   location            = module.resource_group.resource_group_location
#   resource_group_name = module.resource_group.resource_group_name
#   allocation_method   = each.value.allocation_method
#   sku                 = each.value.sku
#   depends_on = [ module.resource_group ]
# }

# module "linux_vm" {
#   source              = "./modules/linuxvm"
#   for_each = var.on_premises_vms
#   name                = each.key
#   location            = module.resource_group.resource_group_location
#   resource_group_name = module.resource_group.resource_group_name
#   subnet_id           = module.virtual_network.subnet_ids["workload"]
#   admin_username      = var.admin_username
#   admin_password      = var.admin_password
#   public_ip_id        = module.public_ip[each.key].id
#   image_publisher     = each.value.image_publisher
#   image_offer         = each.value.image_offer
#   image_sku           = each.value.image_sku
#   depends_on = [ module.virtual_network , module.public_ip ]
# }

