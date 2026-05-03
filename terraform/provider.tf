terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "<your_resource_group_name_for_tfstate>"
    storage_account_name = "<your_storage_account_name_for_tfstate>"
    container_name       = "<your_container_name_for_tfstate>"
  }
}

provider "azurerm" {
  features {}
}
