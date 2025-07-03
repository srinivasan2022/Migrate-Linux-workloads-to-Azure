variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
 
variable "resource_group_location" {
  type        = string
  description = "Azure region for the resource group"
}
 
variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = string
  description = "Base address space of the VNet"
}

variable "subnets" {
  description = "Map of subnets with cidrsubnet calculation values"
  type = map(object({
    newbits   = number
    subnetnum = number
  }))
}

variable "public_ip" {
  description = "Map of public IP configurations"
  type = map(object({
    name                = string
    allocation_method   = string
    sku                 = string
  }))
}

variable "on_premises_vms" {
  description = "Map of on-premises VM configurations"
  type = map(object({
    vm_size         = string
    image_publisher = string
    image_offer     = string
    image_sku       = string
    image_version   = string
  }))
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VMs"

}

variable "admin_password" {
  type        = string
  description = "Admin password for the VMs"
  sensitive   = true
}

variable "VpnGW" {
  description = "Map of on-premises VM configurations"
  type = map(object({
    private_ip_address_allocation = string
    ip_config_name                = string
  }))
}