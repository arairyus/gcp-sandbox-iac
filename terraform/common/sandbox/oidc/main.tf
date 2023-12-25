terraform {
  required_version = ">=1.6.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=5.10.0"
    }
  }
}

data "google_service_account" "main" {
  account_id = "terraform-cicd"
}

module "gh_oidc" {
  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "~> 3.1"

  project_id  = var.project_id
  pool_id     = var.pool_id
  provider_id = var.provider_id
  sa_mapping = {
    "common/sandbox/oidc" = {
      sa_name   = data.google_service_account.main.id
      attribute = "attribute.repository/${var.gh_repository}"
    }
  }
}