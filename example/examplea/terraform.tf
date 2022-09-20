terraform {
  required_providers {
    aws = {
      version = "4.31.0"
      source  = "hashicorp/aws"
    }

    archive = {
      version = "2.2.0"
      source  = "hashicorp/archive"
    }
  }
  required_version = ">=1.2.2"
}
