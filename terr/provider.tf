terraform {
  required_version = ">=1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }

  }

  backend "s3" {
    bucket = "terraform-bucket432"
    key    = "terraform.tfstate"
    region = "us-east-1"

  }

}

provider "aws" {

  region = "us-east-1"
}
####