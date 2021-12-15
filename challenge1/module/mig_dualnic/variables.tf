#common 

variable "project_name" {
  default = "test"
}

variable "region" {
  type = string
  default = "europe-west2"
}

variable "zone" {
  default = ""
}

varibale "subnetwork" {
 default = "" 
}

varibale "subnetwork1" {
 default = "" 
}

variable "machine_type" {
  default = "n1-standard-4"
}

## and so on... Lot of variables which have been used in main.tf can be initialized here to pick default values if value is being assigned while creating resource from requirement specific
