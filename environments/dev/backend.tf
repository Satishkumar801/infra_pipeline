terraform {
  backend "azurerm" {
    resource_group_name  = "satish_rg111"
    storage_account_name = "satishstg111222"
    container_name       = "newcontainer"
    key                  = "infra.tfstate"
  }
}