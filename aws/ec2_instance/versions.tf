terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "CHANGEME"
    key    = "CHANGEME"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

