resource "azurerm_mysql_database" "sql_database" {
  name                = var.sql_database_name
  resource_group_name = var.resource_group_name
  server_name         = var.sql_server_name
  charset             = "utf8"
  collation           = "utf8_general_ci"

  depends_on = [var.mysql_server_id]
}

