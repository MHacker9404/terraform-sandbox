resource "azurerm_key_vault" "key_vault" {
  name                            = "${var.prefix}-kv-01"
  resource_group_name             = azurerm_resource_group.rgp_01.name
  location                        = azurerm_resource_group.rgp_01.location
  tenant_id = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled = false
  sku_name = "standard"
}

resource "azurerm_key_vault_key" "storage_key" {
  name         = "storage"
  key_vault_id = azurerm_key_vault.key_vault.id
  key_type     = "RSA"
  key_size     = 4096

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}