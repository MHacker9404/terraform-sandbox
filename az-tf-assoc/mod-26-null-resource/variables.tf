variable "business_unit" {
  description = "Business Unit Name"
  type = string
  default = "hr"
}
# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type = string
  default = "dev"
}
# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string 
  default = "myvnet"
}
# 6. Subnet Name
variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type = string 
}
# 7. Public IP Name
variable "publicip_name" {
  description = "Public IP Name"
  type = string 
}
# 8. Network Interfance
variable "network_interface_name" {
  description = "Network Interface Name"
  type = string 
}

# 9. Virtual Machine Name
variable "virtual_machine_name" {
  description = "Virtual Machine Name"
  type = string 
}