variable "project_id" {
  type = string
  description = "The ID of the project"
}

variable "region" {
  type = string
  description = "The default region of the project"
  default = "asia-northeast1"
}

variable "impersonate_service_account" {
  type = string
  description = "The service account to impersonate"
}

variable "org_domain" {
  type = string
  description = "The org domain(@sample.com)"
}