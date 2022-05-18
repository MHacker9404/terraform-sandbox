terraform {
  required_version = ">= 1.1.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.5.0"
    }
  }

  backend "azurerm" {
    # resource_group_name  = <*.back-end.conf>
    # storage_account_name = <*.back-end.conf>

    container_name = "remote-state"
    key            = "local/svc-principal-test.tfstate"
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
