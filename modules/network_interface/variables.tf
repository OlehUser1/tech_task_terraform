variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure location where the resources will be created."
}

variable "subnet_id" {
  description = "Subnet ID for the network interface"
}

variable "public_ip_id" {
  description = "Public IP address ID for the network interface"
}