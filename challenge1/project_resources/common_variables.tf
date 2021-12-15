variable "region" {
  default = "europe-west2"
}

variable "environment" {
  default = "dev"
}

variable "project_name" {
  default = "gcp-project-name"
}

variable "subnetwork" {
 default = "projects/host-gcp-project-name/regions/europe-west2/subnetworks/host-project-europe-west2" 
}

variable "subnetwork" {
 default = "projects/gcp-project-name/regions/europe-west2/subnetworks/service-project-europe-west2" 
}

variable "network_firewall_tags" {
  default  = [
    "tag1",
    "tag2",
    "tag3",
    ]
}


## and so on .. All common variables which have to be passed for resource creation can be passed from here.
