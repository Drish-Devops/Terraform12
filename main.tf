terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Resource_Group_S"
    storage_account_name = "devopstorageacc"
    container_name       = "mycontainer"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
 features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-Harpreet"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "harpreetstorageacc"
  resource_group_name      = "rg-Harpreet"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}