resource "azurerm_public_ip" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method   = var.allocation_method
  sku                 = var.sku

}
