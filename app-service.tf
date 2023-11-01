resource "azurerm_service_plan" "backend" {
  name                = "${var.project}-backend-appserviceplan"
  location            = azurerm_resource_group.backend.location
  resource_group_name = azurerm_resource_group.backend.name
  os_type                = "Linux"
  #reserved            = true # required for Linux plans, might need to be in a properties thing
  sku_name = "B1"
  
}
resource "azurerm_app_service" "backend" {
  name                = "${var.project}-backend-app-service"
  location            = azurerm_resource_group.backend.location
  resource_group_name = azurerm_resource_group.backend.name
  app_service_plan_id = azurerm_service_plan.backend.id
  app_settings = {
    DOCKER_REGISTRY_SERVER_URL          = azurerm_container_registry.registry.login_server
    DOCKER_REGISTRY_SERVER_USERNAME     = azurerm_container_registry.registry.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD     = azurerm_container_registry.registry.admin_password
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    WEBSITES_PORT                       = var.backendport
  }

  site_config {
    always_on = "true"
    # define the images to used for you application
    linux_fx_version = "DOCKER|${azurerm_container_registry.registry.login_server}/sample-app:latest}"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_app_service.backend.identity.0.principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.registry.id
  skip_service_principal_aad_check = true
}