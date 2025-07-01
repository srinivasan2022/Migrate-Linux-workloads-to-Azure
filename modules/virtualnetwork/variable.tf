variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}
 
variable "vnet_address_space" {
  type        = string
  description = "Base address space of the VNet"
}
 
variable "location" {
  type        = string
  description = "Azure region"
}
 
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
 

 
variable "subnets" {
  description = "Map of subnets with cidrsubnet calculation values"
  type = map(object({
    newbits   = number
    subnetnum = number
  }))
}