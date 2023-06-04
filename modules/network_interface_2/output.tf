output "network_interface_2_id" {
  value = azurerm_network_interface.proxy_server_nic.id
}

output "private_ip_2_address" {
  value = azurerm_network_interface.proxy_server_nic.private_ip_address
}