output "vpn_connection_id" {
  value = azurerm_virtual_network_gateway_connection.vpn_connection.id
}
 
output "vpn_connection_name" {
  value = azurerm_virtual_network_gateway_connection.vpn_connection.name
}