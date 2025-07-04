variable "peering_name" {
  description = "Name of the peering connection"
  type        = string
}

variable "source_resource_group" {
  description = "Resource group of the source VNet"
  type        = string
}

variable "source_vnet_name" {
  description = "Name of the source VNet"
  type        = string
}

variable "target_vnet_id" {
  description = "ID of the remote VNet to peer with"
  type        = string
}

variable "allow_virtual_network_access" {
  type    = bool
  default = true
}

variable "allow_forwarded_traffic" {
  type    = bool
  default = false
}

variable "allow_gateway_transit" {
  type    = bool
  default = false
}

variable "use_remote_gateways" {
  type    = bool
  default = false
}
