variable "name" {
  description = "Name of the Bastion host"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "dns_name" {
  description = "Optional DNS name label for the Bastion host"
  type        = string
  default     = null
}

variable "bastion_subnet_id" {
  description = "The subnet ID (must be named 'AzureBastionSubnet')"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
