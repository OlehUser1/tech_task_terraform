variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The Azure location where the resources will be created."
}

variable "allowed_ips" {
  description = "List of allowed IP addresses for accessing the virtual machine"
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet"
}
