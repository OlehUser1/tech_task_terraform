output "public_ip_id" {
  value = azurerm_public_ip.web_server_pip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.web_server_pip.ip_address
}