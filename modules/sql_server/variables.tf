variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure location where the resources will be created."
}

variable "sql_server_name" {
  description = "The name of the SQL server."
}

variable "sql_admin_username" {
  description = "The administrator username for the SQL server."
}

variable "sql_admin_password" {
  description = "The administrator password for the SQL server."
  sensitive   = true
}

variable "subnet_id" {
    description = "Subnet id"
}

variable "network_id" {}

