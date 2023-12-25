terraform {
  required_version = ">=1.6.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=5.10.0"
    }
  }
}