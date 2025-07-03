resource "azurerm_virtual_network_gateway" "vpn_gw" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
 
  type     = "Vpn"
  vpn_type = var.vpn_type
  sku      = var.gateway_sku
  active_active = var.active_active
  enable_bgp    = var.enable_bgp
 
  ip_configuration {
    name                          = var.ip_config_name
    public_ip_address_id          = var.public_ip_id
    subnet_id                     = var.gateway_subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }

}