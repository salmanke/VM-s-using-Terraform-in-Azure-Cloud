terraform {
  backend "azurerm" {
    resource_group_name  = "CMSXPODAnalytics-Terraform"
    storage_account_name = "cmsxpodterraformbackend"
    container_name       = "nsg-state-container01"
    key                  = "nsg01.tfstate"
  }
}