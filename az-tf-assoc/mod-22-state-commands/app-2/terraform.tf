terraform {
  required_version = ">= 1.1.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.5.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "PRB-DEV-REMOTE-STATE"
    storage_account_name = "prbdevhz797usunfztnv7lgh"
    container_name = "remote-state"
    key = "dev/mod-22-app-2.terraform.tfstate"
  }
}
