terraform {
  required_version = ">=1.1.9"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.5.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

resource "azurerm_resource_group" "rg_mod_05" {
  location = "eastus"
  name     = "rg_mod_05"
}

variable "default_region" {
  default = "eastus"
  description = "Default AZ region for resources to be created"
  type = string
}

output "az_rg_id" {
  description = "The AZ resource group id"
  value = azurerm_resource_group.rg_mod_05.id
}

locals {
  name = "${var.default_region.value}"
}