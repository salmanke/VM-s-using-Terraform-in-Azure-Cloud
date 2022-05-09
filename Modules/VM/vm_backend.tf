terraform {
  backend "azurerm" {
    resource_group_name  = "CMSXPODAnalytics-Terraform"
    storage_account_name = "cmsxpodterraformbackend"
    container_name       = "vm-state-container01"
    key                  = "vm01.tfstate"
  }
}