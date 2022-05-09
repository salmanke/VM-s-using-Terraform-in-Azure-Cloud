terraform {
  backend "azurerm" {
    resource_group_name  = "CMSXPODAnalytics-Terraform"
    storage_account_name = "cmsxpodterraformbackend"
    container_name       = "subnet-state-container01"
    key                  = "subnet01.tfstate"
  }
}