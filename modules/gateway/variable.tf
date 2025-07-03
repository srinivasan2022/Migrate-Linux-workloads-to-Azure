variable "name" {
  type        = string
  description = "Name of the VPN gateway"
}
 
variable "location" {
  type        = string
  description = "Azure region"
}
 
variable "resource_group_name" {
  type        = string
  description = "Resource group for the gateway"
}
 
variable "gateway_subnet_id" {
  type        = string
  description = "ID of the GatewaySubnet (must be named 'GatewaySubnet')"
}
 
variable "vpn_type" {
  type        = string
  default     = "RouteBased"
  description = "VPN type: RouteBased or PolicyBased"
}
 
variable "gateway_sku" {
  type        = string
  default     = "VpnGw1"
  description = "Gateway SKU, e.g., VpnGw1, VpnGw2, etc."
}
 
variable "enable_bgp" {
  type        = bool
  default     = false
}
 
variable "active_active" {
  type        = bool
  default     = false
}
 
variable "public_ip_id" {
    type = string
  
}
variable "ip_config_name" {
  type = string
}
variable "private_ip_address_allocation" {
  type = string
}