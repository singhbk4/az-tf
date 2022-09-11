# Terraform block
terraform {
  required_version = ">= 1.2.0"
  required_providers {
    azurerm = {
        version = ">= 2.0"
        source = "hashicorp/azurerm"
    }
  }
}

# Provider block
provider "azurerm" {
  features {
    
  }
  
}