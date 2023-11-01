resource "azurerm_resource_group" "shared" {
  name     = "rg-${var.project}-shared"
  location = var.region

}

resource "azurerm_resource_group" "backend" {
  name     = "rg-${var.project}-backend"
  location = var.region

}

resource "azurerm_log_analytics_workspace" "mtn_app_la" {
  name                = "log-shared-log-analytics"
  location            = azurerm_resource_group.shared.location
  resource_group_name = azurerm_resource_group.shared.name

}