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

variable "org_domain" {
  type        = string
  description = "The org domain(@sample.com)"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR of the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_count" {
  type        = number
  description = "The number of subnets"
  default     = 2
}

variable "firewall_rules" {
  type        = any
  description = "The list of firewall rules"
  default     = []
}