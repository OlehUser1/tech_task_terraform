module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "virtual_network" {
  source              = "./modules/virtual_network"
  name                = var.virtual_network_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
}

module "subnet" {
  source               = "./modules/subnet"
  name                 = var.subnet_name
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.virtual_network.virtual_network_name
}

module "public_ip" {
  source              = "./modules/public_ip"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
}

module "public_ip_2" {
  source              = "./modules/public_ip_2"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
}

module "network_interface" {
  source              = "./modules/network_interface"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  subnet_id           = module.subnet.subnet_id
  public_ip_id        = module.public_ip.public_ip_id
}

module "network_interface_2" {
  source              = "./modules/network_interface_2"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  subnet_id           = module.subnet.subnet_id
  public_ip_2_id      = module.public_ip_2.public_ip_2_id
}

module "virtual_machine" {
  source               = "./modules/virtual_machine"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  network_interface_id = module.network_interface.network_interface_id
  public_ip_id         = module.public_ip.public_ip_id
  vm_admin_username    = var.vm_admin_username
}

module "virtual_machine_2" {
  source               = "./modules/virtual_machine_2"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  network_interface_id = module.network_interface_2.network_interface_2_id
  public_ip_id         = module.public_ip_2.public_ip_2_id
  vm_admin_username    = var.vm_admin_username
}

module "network_security_group" {
  source              = "./modules/network_security_group"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  allowed_ips                 = var.allowed_ips
  subnet_id                 = module.subnet.subnet_id
}

module "mysql_server" {
  source = "./modules/sql_server"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  sql_server_name     = var.sql_server_name
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = data.azurerm_key_vault_secret.sql_admin_password.value
  subnet_id           = module.subnet.subnet_id
  network_id          = module.virtual_network.virtual_network_id

}

module "mysql_database" {
  source = "./modules/database"

  sql_database_name   = var.sql_database_name
  resource_group_name = module.resource_group.resource_group_name
  sql_server_name     = var.sql_server_name
  mysql_server_id     = module.mysql_server.mysql_server_id
  
}
