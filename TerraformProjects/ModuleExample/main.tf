terraform {
  required_providers {
    azurerm = {
        source = "harshicorp/azurerm"
        version = "2.88.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
    features  {

    }
}

module "ResourceGroup" {
    source = "./ResourceGroup"
    base_name = "TerraformExample02"
    location = "francecentral"
  
}

module "StorageAccount" {
  source = "./Storage Account"
  base_name = "TerraformExample02"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "francecentral"
}