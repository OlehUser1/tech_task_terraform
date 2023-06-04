variable "resource_group_name" {
  description = "The name of the Azure resource group"
}

variable "location" {
  description = "The location of the Azure resources"
}

variable "vm_admin_username" {
  description = "The admin username for the virtual machine"
}

variable "network_interface_id" {
  description = "The ID of the network interface for the virtual machine"
}

variable "public_ip_id" {
  description = "The ID of the public IP address for the network interface"
}