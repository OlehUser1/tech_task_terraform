output "mysql_server_name" {
  value = azurerm_mysql_server.sql_server.name
}


output "mysql_server_fqdn" {
  value = azurerm_mysql_server.sql_server.fqdn
}

output "sql_admin_username" {
  value = var.sql_admin_username
}

output "sql_admin_password" {
  value = var.sql_admin_password
  sensitive = true
}

output "mysql_server_id" {
  value = azurerm_mysql_server.sql_server.id
}