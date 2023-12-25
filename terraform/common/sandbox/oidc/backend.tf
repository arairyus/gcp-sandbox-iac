terraform {
  backend "gcs" {
    prefix = "common/sandbox/oidc"
  }
}
