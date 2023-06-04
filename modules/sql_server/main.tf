resource "azurerm_mysql_server" "sql_server" {
  name                = var.sql_server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false

  tags = {
    Terraform = "true"
  }
  
}

resource "azurerm_private_endpoint" "sql_endpoint" {
  name                = "sql-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "sql-privateserviceconnection"
    private_connection_resource_id = azurerm_mysql_server.sql_server.id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_zone" "mydnszone" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mydnslink" {
  name                  = "my-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.mydnszone.name
  virtual_network_id    = var.network_id
}

resource "azurerm_private_dns_a_record" "mydnsrecord" {
  name                = azurerm_mysql_server.sql_server.name
  zone_name           = azurerm_private_dns_zone.mydnszone.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.sql_endpoint.private_service_connection[0].private_ip_address]
}