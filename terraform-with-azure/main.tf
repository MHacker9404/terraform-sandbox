terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.79.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  environment = "public"
}
