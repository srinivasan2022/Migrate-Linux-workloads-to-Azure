variable "name" {
  description = "Name of the Private Endpoint"
  type        = string
}
 
variable "location" {
  type = string
}
 
variable "resource_group_name" {
  type = string
}
 
variable "private_dns_zone_name" {
  description = "e.g. privatelink.postgres.database.azure.com"
  type        = string
}
 
variable "vnet_id" {
  type = string
}
 
variable "private_endpoint_subnet_id" {
  type = string
}
 
variable "private_connection_resource_id" {
  description = "The ID of the resource to connect privately (e.g. PostgreSQL server ID)"
  type        = string
}
 
variable "subresource_name" {
  description = "The subresource name (e.g. 'postgresqlServer', 'vault', 'blob', etc.)"
  type        = string
}