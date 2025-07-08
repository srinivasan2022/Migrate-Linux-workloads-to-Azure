
 variable "pv-name" {
   type = string
   description = "private endpoint name"
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

variable "postgres_servers" {
  description = "Map of PostgreSQL server configurations"
  type = map(object({
    admin_username               = string
    admin_password               = string                          
  }))
}
