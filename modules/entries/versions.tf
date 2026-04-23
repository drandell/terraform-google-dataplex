terraform {
  required_version = ">= 1.3.0, < 2.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.49.0, < 8.0.0"
    }
  }
}