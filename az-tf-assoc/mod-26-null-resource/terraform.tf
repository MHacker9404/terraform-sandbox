terraform {
  required_version = ">= 1.1.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.3"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.7.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "PRB-DEV-REMOTE-STATE"
    storage_account_name = "prbdevhz797usunfztnv7lgh"
    container_name       = "remote-state"
    key                  = "dev/mod-26.terraform.tfstate"
  }
}
