terraform {
  backend "gcs" {
    prefix = "common/sandbox/project-factory"
  }
}
