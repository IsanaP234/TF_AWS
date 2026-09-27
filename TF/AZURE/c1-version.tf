terraform {
  required_version = "~>1.15"
  required_providers {
    azure = {
        source  = "hashicorp/azurerm"
        version = "~> 5.0"
    }
  }
}
#provider block
provider "azure" {
  features {}
  
}

