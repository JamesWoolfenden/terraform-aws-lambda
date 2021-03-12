terraform {
  required_providers {
    aws = {
      version = "3.32.0"
      source  = "hashicorp/aws"
    }

    archive = {
      version = "2.0.0"
      source  = "hashicorp/archive"
    }
  }
}
