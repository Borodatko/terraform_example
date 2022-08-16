terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  cloud {
    organization = "CHANGEME"
    hostname = "app.terraform.io"
    workspaces {
      name = "CHANGEME"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
