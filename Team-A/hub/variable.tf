
 
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



variable "VpnGW" {
  description = "Map of on-premises VM configurations"
  type = map(object({
    private_ip_address_allocation = string
    ip_config_name                = string
  }))
}

variable "admin_password" {
  type        = string
  
  sensitive   = true
}