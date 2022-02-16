terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }

  required_version = "~> 1.0.7"

  backend "azurerm" {
    resource_group_name = "prb-remote-state"
    storage_account_name = "prbremotestate"
    container_name = "remote-state-01"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  # Configuration options
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion = true
      graceful_shutdown          = false
    }
  }
  environment = "public"
}
