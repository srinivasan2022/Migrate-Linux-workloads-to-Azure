variable "name" {
  type        = string
  description = "NSG name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "rules_file" {
  type        = string
  description = "Path to CSV file containing NSG rules"
}

