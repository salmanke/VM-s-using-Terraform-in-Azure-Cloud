terraform {
  backend "azurerm" {
    resource_group_name  = "CMSXPODAnalytics-Terraform"
    storage_account_name = "cmsxpodterraformbackend"
    container_name       = "lb-state-container01"
    key                  = "lb01.tfstate"
  }
}