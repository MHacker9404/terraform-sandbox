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

# Create a resource group
resource "azurerm_resource_group" "demo" {
  name     = "first-steps-demo"
  location = var.location
}
