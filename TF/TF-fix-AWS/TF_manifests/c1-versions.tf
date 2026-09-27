terraform {
  required_version = "~>1.15" #Terraform version
  required_providers {
    #here aws is the local value that we define. It can be anything aws1, aws2 etcs
    aws = {
      source  = "hashicorp/aws" #terraform aws plugin, pulls from default TF registry
      version = "~> 6.0"
    }
  }
}
#Above is the terraform settings block

#provider block is used to configure the provider. In this case, we are configuring the AWS provider with the region and profile.
provider "aws" {
  region  = "us-east-1" #AWS region 
} #Additional provider specifications
#By default the profile is default 
 
