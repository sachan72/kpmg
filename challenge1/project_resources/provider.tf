provider "template" {
  version = "~>2.1.2"
}

provider "google" {
  project = var.project_name
  region = var.region
  version = "=3.23.0"
}

provider "google-beta" {
  project = var.project_name
  region = var.region
  version = "=3.23.0"
}

terraform {
  required_version = "=0.12.25"
  
  backed "gcs" {
    bucket = "gcp-project-name-tf"
    prefix = "gcp-project-name-tf/main"
  }
}
