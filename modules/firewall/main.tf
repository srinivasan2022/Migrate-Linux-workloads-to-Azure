resource "azurerm_firewall_policy" "fw_policy" {
  name                = var.policy_name
  location            = var.location
  resource_group_name = var.resource_group_name
  
}
 
resource "azurerm_firewall" "fw" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
 
  firewall_policy_id = azurerm_firewall_policy.fw_policy.id
 
  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = var.public_ip_id
  }
}