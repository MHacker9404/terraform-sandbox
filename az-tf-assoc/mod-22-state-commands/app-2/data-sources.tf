data "azurerm_subscription" "current" {}

data "terraform_remote_state" "app_1" {
  backend = "azurerm"
  config = {
    resource_group_name  = "PRB-DEV-REMOTE-STATE"
    storage_account_name = "prbdevhz797usunfztnv7lgh"
    container_name       = "remote-state"
    key                  = "dev/mod-22-app-1.terraform.tfstate"
  }
}
