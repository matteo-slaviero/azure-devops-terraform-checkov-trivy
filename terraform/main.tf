resource "azurerm_storage_account" "yourstorageaccount" {
  name                     = var.demo_storage_account_name
  resource_group_name      = var.demo_resource_group_name
  location                 = var.primary_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
