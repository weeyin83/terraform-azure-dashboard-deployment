# Azurerm Provider configuration
provider "azurerm" {
  features {}
}

module "dashboard" {
  source  = "kumarvna/dashboard/azurerm"
  version = "1.1.0"

  # This module will not create a resource group, provide the name and location of an existing resource group.
  resource_group_name = "demo-azurelab"
  location            = "westeurope"

  # Dashboard configuration
  dashboards = [
    {
      name           = "Azure-Arc-Windows-Linux-Dashboard"
      json_file_path = "./dashboard.json"
      variables = {
        "title" = "Azure-Arc-Windows-Linux-Dashboard"
      }
    }
  ]

  # Adding TAG's to your Azure resources 
  tags = {
    ProjectName  = "azurearc"
    Env          = "prod"
  }
}