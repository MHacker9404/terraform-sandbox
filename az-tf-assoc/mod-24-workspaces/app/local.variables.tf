locals {
  udemy_module = (terraform.workspace == "default") ? "mod-24" : "mod-24-${terraform.workspace}"
  location = "eastus"
}