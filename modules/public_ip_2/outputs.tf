output "public_ip_2_id" {
  value = azurerm_public_ip.proxy_server_pip.id
}

output "public_ip_2_address" {
  value = azurerm_public_ip.proxy_server_pip.ip_address
}