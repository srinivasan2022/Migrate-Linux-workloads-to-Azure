resource "azurerm_postgresql_flexible_server" "pg" {
  name                   = var.name
  location               = var.location
  resource_group_name    = var.resource_group_name
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
 
  sku_name               = var.sku_name
  version                = var.version
  storage_mb             = var.storage_mb
  backup_retention_days  = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
 
  delegated_subnet_id    = var.subnet_id
  //private_dns_zone_id    = var.private_dns_zone_id
 
  zone = var.zone
 
}