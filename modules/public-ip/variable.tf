variable "name" {
  description = "Name of the public IP"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which to create the public IP"
  type        = string
}

variable "allocation_method" {
  description = "Allocation method: Static or Dynamic"
  type        = string
  default     = "Dynamic"
}

variable "sku" {
  description = "SKU of the public IP. Standard or Basic"
  type        = string
  default     = "Basic"
}


