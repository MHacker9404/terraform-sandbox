variable "mod_name" {
  type = string
  description = "Mod Name"
  default = "MOD-18"
}

variable "rg_name" {
  type = string
  description = "Resource Group name"
  default = "RG"
}

variable "rg_location" {
  type = string
  description = "Resource Group location"
  default = "eastus"
}

variable "environment" {
  type = string
  description = "Environment"
  default = "dev"
}

variable "vnet_address_space_dev" {
  type = list(string)
  description = "DEV address space"
  default = ["10.0.0.0/16"]
}

variable "vnet_address_space_all" {
  type = list(string)
  description = "All address space except DEV"
  default = [ "10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16" ]
}