terraform {
  required_version = ">=1.6.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "< 5.0.0"
    }
  }
}
locals {
  subnets = [for i in range(var.subnet_count) : {
    subnet_name           = "sandbox-subnet-${format("%02d", i + 1)}"
    subnet_ip             = cidrsubnet(var.vpc_cidr, 8, i)
    subnet_region         = var.region
    subnet_private_access = true
    subnet_flow_logs      = false
  }]
}

resource "google_project_service" "service" {
  for_each = toset(var.enabled_services)

  project = var.project_id
  service = each.value

  disable_dependent_services = true
}

module "shared_vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.2"

  project_id     = var.project_id
  network_name   = "common-sandbox-shared-vpc"
  subnets        = local.subnets
  firewall_rules = var.firewall_rules
  shared_vpc_host = true

  depends_on = [google_project_service.service]
}