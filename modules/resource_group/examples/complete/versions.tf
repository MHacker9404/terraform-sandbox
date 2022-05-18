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

    # container_name = <*.back-end.conf>
    # key            = <*.back-end.conf>
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id
  subscription_id = "f5292d62-be5e-42ef-b19a-ba78716ab071"
  client_id       = "ee4d0c08-8a4a-454c-ba59-4871b2064158"
  client_secret   = "X5g8Q~Ls2LHuxfY62d2UXWG_-8SFr2ELuQAupcK2"
  tenant_id       = "f5ce049d-d94e-459d-af21-178928862071"
}
