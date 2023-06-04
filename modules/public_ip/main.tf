resource "azurerm_public_ip" "web_server_pip" {
  name                = "web-server-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}