variable "project_id" {
  type        = string
  description = "The ID of the project"
}

variable "region" {
  type        = string
  description = "The default region of the project"
  default     = "asia-northeast1"
}

variable "impersonate_service_account" {
  type        = string
  description = "The service account to impersonate"
}

variable "org_id" {
  type        = string
  description = "The ID of the organization"
}

variable "projects" {
  type        = list(string)
  description = "The list of projects"
  default     = ["sandbox-arairyus"]
}

variable "folder_id" {
  type        = string
  description = "The ID of the folder"
}

variable "billing_account_id" {
  type        = string
  description = "The ID of the billing account"
}

variable "tfstate_bucket" {
  type        = string
  description = "The name of the bucket"
}