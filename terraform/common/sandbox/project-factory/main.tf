terraform {
  required_version = ">=1.6.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.10.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.58.0"
    }
  }
}

data "terraform_remote_state" "common" {
  backend = "gcs"

  config = {
    bucket                      = var.tfstate_bucket
    prefix                      = "common/sandbox/shared-vpc"
    impersonate_service_account = var.impersonate_service_account
  }
}

data "google_organization" "org" {
  organization = "organizations/${var.org_id}"
}

data "google_folder" "sandbox" {
  folder              = "folders/${var.folder_id}"
  lookup_organization = true
}

data "google_billing_account" "main" {
  billing_account = "billingAccounts/${var.billing_account_id}"
  open            = true
}

module "project_factory" {
  count = length(var.projects)

  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.4"

  name              = var.projects[count.index]
  project_id        = var.projects[count.index]
  random_project_id = true
  org_id            = data.google_organization.org.org_id
  folder_id         = data.google_folder.sandbox.id
  activate_apis = [
    "iam.googleapis.com",
    "compute.googleapis.com",
  ]
  billing_account      = data.google_billing_account.main.id
  svpc_host_project_id = data.terraform_remote_state.common.outputs.project_id
  shared_vpc_subnets = [
    data.terraform_remote_state.common.outputs.subnets[count.index],
  ]

  default_service_account = "disable"                          # default_service_account = デフォルトComputeサービスアカウント
  project_sa_name         = "${var.projects[count.index]}-iac" # IaC用サービスアカウント
}