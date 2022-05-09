terraform {
  backend "azurerm" {
    resource_group_name  = "CMSXPODAnalytics-Terraform"
    storage_account_name = "cmsxpodterraformbackend"
    container_name       = "vnet-state-container01"
    key                  = "vnet01.tfstate"
  }
}