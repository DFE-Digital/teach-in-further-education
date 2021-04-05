terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }

  backend "azurerm" {}
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource-group" {
  name     = "teach-fe-${var.environment}"
  location = var.location
}

module "website" {
  source = "./website"
  resource-group = azurerm_resource_group.resource-group.name
  environment = var.environment
  location = var.location
}