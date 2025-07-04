output "bastion_id" {
  value = azurerm_bastion_host.bastion.id
}

output "bastion_dns" {
  value = azurerm_bastion_host.bastion.dns_name
}
