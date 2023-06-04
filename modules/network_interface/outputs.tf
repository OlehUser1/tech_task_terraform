output "network_interface_id" {
  value = azurerm_network_interface.web_server_nic.id
}

output "private_ip_address" {
  value = azurerm_network_interface.web_server_nic.private_ip_address
}