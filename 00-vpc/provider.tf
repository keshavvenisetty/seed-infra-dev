terraform {
 required_providers {
   aws = {
     source = "hashicorp/aws" # Specifies the provider source
     version = "5.98.0" # Specifies the version constraint
   }
 }

 backend "s3" {
    bucket = "84ask-remote-state-dev"
    key = "roboshop-dev-vpc"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true 
   }
}
provider "aws" {
  # Specifies the AWS region
  region = "us-east-1"
}
