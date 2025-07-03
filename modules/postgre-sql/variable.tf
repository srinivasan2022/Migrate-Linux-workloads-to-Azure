variable "name" {
  type        = string
  description = "PostgreSQL server name"
}
 
variable "location" {
  type        = string
  description = "Azure region"
}
 
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
 
variable "admin_username" {
  type        = string
  description = "Admin username for PostgreSQL"
}
 
variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Admin password for PostgreSQL"
}
 
variable "sku_name" {
  type        = string
  default     = "Standard_B1ms"
  description = "SKU name"
}
 
variable "version" {
  type        = string
  default     = "16"
  description = "PostgreSQL version"
}
 
variable "storage_mb" {
  type        = number
  default     = 32768
  description = "Storage in MB"
}
 
variable "backup_retention_days" {
  type        = number
  default     = 7
  description = "Backup retention period"
}
 
variable "geo_redundant_backup_enabled" {
  type        = bool
  default     = false
}
 
variable "zone" {
  type        = string
  default     = "1"
}
 
variable "subnet_id" {
  type        = string
  description = "Delegated subnet ID"
}
 
# variable "private_dns_zone_id" {
#   type        = string
#   description = "Private DNS zone ID for PostgreSQL"
# }
 
