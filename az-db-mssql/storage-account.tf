resource "azurerm_storage_account" "storage" {
  name                      = "${var.prefix}-stg-01"
  resource_group_name       = azurerm_resource_group.rgp-01.name
  location                  = azurerm_resource_group.rgp-01.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
}


resource "azurerm_storage_container" "container-01" {
  name                  = "scripts"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "custom-data" {
  name                   = "custom-data.sh"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container-01.name
  type                   = "Block"
  source_content         = file("custom-data.sh")
}
