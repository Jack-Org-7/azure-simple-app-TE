# Azure Container Registry - house our simple MTN Docker Image
resource "azurerm_container_registry" "registry" {

  name                = "acmeregistry" 
  resource_group_name = azurerm_resource_group.shared.name
  location            = azurerm_resource_group.shared.location
  sku                 = "Standard"
  admin_enabled       = true # required for App Service
}