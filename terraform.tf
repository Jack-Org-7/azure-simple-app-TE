terraform {
  cloud {
    organization = "ACME_DEMO_01"

    workspaces {
      name = "azure-simple-app-TE"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.52.0"
    }
  }
}

provider "azurerm" {
  features {}
}
