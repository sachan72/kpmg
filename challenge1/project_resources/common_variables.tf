variable "region" {
  default = "europe-west2"
}

variable "environment" {
  default = "dev"
}

variable "project_name" {
  default = "gcp-project-name"
}

## and so on .. All common variables which have to be passed for resource creation can be passed from here.
