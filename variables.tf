variable "location" {
  description = "The Azure location where the resources will be created."
}

variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "sql_server_name" {
  description = "The name of the SQL server."
}

variable "sql_admin_username" {
  description = "The administrator username for the SQL server."
}


variable "sql_database_name" {
  description = "The name of the SQL database."
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
}

variable "subnet_name" {
  description = "The name of the subnet."
}

variable "vm_admin_username" {
  description = "The name of the admin user."
}

variable "allowed_ips" {
  description = "List of allowed IP addresses for accessing the virtual machine"
  type        = list(string)
  default     = []
}