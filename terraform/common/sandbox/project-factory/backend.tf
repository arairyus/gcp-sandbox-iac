terraform {
  backend "gcs" {
    prefix = "sandbox/project-factory"
  }
}
