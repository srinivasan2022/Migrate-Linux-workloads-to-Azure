resource "azurerm_local_network_gateway" "lng" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
 
  gateway_address = var.gateway_address
 
  address_space = var.address_space
 
  bgp_settings {
    asn = var.bgp_asn
    bgp_peering_address = var.bgp_peering_address
  }
 
  
}