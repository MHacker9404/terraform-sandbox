resource "azurerm_linux_virtual_machine" "group1" {
    count = var.group1_count
}
resource "azurerm_linux_virtual_machine" "group2" {
    count = var.group2_count
}
locals {
  vm_ids = concat(azurerm_linux_virtual_machine.group1.*.id, azurerm_linux_virtual_machine.group2.*.id)
}

resource "azurerm_key_vault_secret" "secret" {
    name = "vm_ids"
    value = join(",", local.vm_ids)
    key_vault_id = azurerm_key_vault.example.id
}