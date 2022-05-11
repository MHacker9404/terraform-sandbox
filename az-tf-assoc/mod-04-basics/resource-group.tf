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

resource "azurerm_resource_group" "rg_mod_04" {
  location = "eastus"
  name     = "rg_mod_04"
}
