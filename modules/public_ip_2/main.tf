resource "azurerm_public_ip" "proxy_server_pip" {
  name                = "proxy-server-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}