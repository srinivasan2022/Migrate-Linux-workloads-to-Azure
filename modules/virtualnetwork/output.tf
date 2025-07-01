output "vnet_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}
 
output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}
 
output "vnet_address_space" {
  description = "The address space of the Virtual Network"
  value       = azurerm_virtual_network.vnet.address_space
}
 
output "subnet_ids" {
  description = "A map of subnet names to their IDs"
  value = {
    for subnet in azurerm_virtual_network.vnet.subnet :
    subnet.name => subnet.id
  }
}
 
output "subnet_prefixes" {
  description = "A map of subnet names to their prefixes"
  value = {
    for subnet in azurerm_virtual_network.vnet.subnet :
    subnet.name => subnet.address_prefix
  }
}