resource "azurerm_network_security_group" "web_server_nsg" {
  name                = "web-server-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Allow_HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefixes      = var.allowed_ips
    destination_address_prefix = "*"
  }

  security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefixes     = var.allowed_ips
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "Allow_HTTPS"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefixes      = var.allowed_ips
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "SQL"
        priority                   = 1004
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefixes      = var.allowed_ips
        destination_address_prefix = "*"
    }
}

resource "azurerm_subnet_network_security_group_association" "web_server_nsg_association" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.web_server_nsg.id
  depends_on = [
    azurerm_network_security_group.web_server_nsg
  ]
}