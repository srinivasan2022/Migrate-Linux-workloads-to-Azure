output "postgres_id" {
  value = azurerm_postgresql_flexible_server.pg.id
}
 
output "postgres_fqdn" {
  value = azurerm_postgresql_flexible_server.pg.fqdn
}
 
output "postgres_name" {
  value = azurerm_postgresql_flexible_server.pg.name
}