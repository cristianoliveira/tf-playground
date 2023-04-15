terraform {
  cloud {
    organization = "cristianoliveiradev"

    workspaces {
      name = "cristianoliveiradev"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}
