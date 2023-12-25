terraform {
  backend "gcs" {
    prefix                      = "common/sandbox/shared-vpc"
  }
}
