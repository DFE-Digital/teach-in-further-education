resource "azurerm_storage_account" "website-storage" {
  account_replication_type = "LRS"
  account_tier = "Standard"
  location = var.location
  name = "teachfestorage${var.environment}"
  resource_group_name = var.resource-group
  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }
}