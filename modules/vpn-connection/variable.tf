variable "name" {
  type        = string
  description = "Name of the VPN connection"
}
 
variable "location" {
  type        = string
  description = "Azure region"
}
 
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
 
variable "vnet_gateway_id" {
  type        = string
  description = "ID of the Azure Virtual Network Gateway"
}
 
variable "local_gateway_id" {
  type        = string
  description = "ID of the Local Network Gateway"
}
 
variable "shared_key" {
  type        = string
  description = "Shared key (pre-shared key) for VPN connection"
  sensitive   = true
}
 
variable "enable_bgp" {
  type        = bool
  default     = false
  description = "Enable BGP for the connection"
}
 
