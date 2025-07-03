resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.resource_group_name
 
}
 
resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name                  = "${var.name}-vnetlink"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.dns_zone.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false

}
 
resource "azurerm_private_endpoint" "pe" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
 
  private_service_connection {
    name                           = "${var.name}-psc"
    private_connection_resource_id = var.private_connection_resource_id
    is_manual_connection           = false
    subresource_names              = [var.subresource_name]
  }
 
  private_dns_zone_group {
    name                 = "${var.name}-dnszonegroup"
    private_dns_zone_ids = [azurerm_private_dns_zone.dns_zone.id]
  }
 
 
}