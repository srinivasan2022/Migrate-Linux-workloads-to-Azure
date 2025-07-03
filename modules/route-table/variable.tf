variable "name" {
  type        = string
  description = "Name of the route table"
}
 
variable "location" {
  type        = string
  description = "Azure region"
}
 
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
 
variable "disable_bgp_route_propagation" {
  type        = bool
  default     = false
  description = "Disable BGP route propagation"
}
 

 
variable "routes" {
  type = map(object({
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  description = "Map of route definitions"
}