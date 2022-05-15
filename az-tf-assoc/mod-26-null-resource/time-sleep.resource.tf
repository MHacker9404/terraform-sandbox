resource "time_sleep" "wait_90_sec" {
  depends_on      = [azurerm_resource_group.rg_mod_26]
  create_duration = "90s"
}
