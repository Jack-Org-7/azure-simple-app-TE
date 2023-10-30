resource "azurerm_resource_group" "my_first_app" {
  name     = "rg-${var.app}"
  location = var.region

}