variable "location" {
  type        = string
  description = "Azure region"
}
 
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
 
variable "firewall_name" {
  type        = string
  description = "Name of the Azure Firewall"
}
 
variable "policy_name" {
  type        = string
  description = "Name of the Firewall Policy"
}
 
variable "firewall_subnet_id" {
  type        = string
  description = "ID of the subnet named AzureFirewallSubnet"
}
 
variable "public_ip_id" {
  type        = string
  description = "ID of the Public IP address assigned to the firewall"
}
 