variable "resource_group_name" {
  type        = string
  description = "Resource Group to host the VM"
}
variable "vnet_name" {
  type        = string
  description = "VNet name for the VM"
}
variable "snet_name" {
  type        = string
  description = "Subnet name for the VM"
}
variable "nic_name" {
  type        = string
  description = "NIC name for the VM"
}
