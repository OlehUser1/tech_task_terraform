output "network_security_group_id" {
  value = azurerm_network_security_group.web_server_nsg.id
}

output "nsg_association_id" {
  value = azurerm_subnet_network_security_group_association.web_server_nsg_association.id
}