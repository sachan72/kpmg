data "google_compute_zones" "available" {
  project = var.project_name
  region = var.region
}

locals {
  gce_prefix = "gce- ${substr(var.region,0,2)}"
}
resource "google_compute_instance_template" "linux" {
  count         = var.linux ? 1 : 0 
  project       = var.project_name
  name_prefix   = "${local.gce_prefix}-"
  machine_type  = var.machine_type
  tags = var.tags
  
  network_interface {
    subnetwork = var.subnetwork
    network_ip = var.vm_ip_address
  }
  
  network_interface {
    subnetwork = var.subnetwork1
  }
  
  disk {
    device_name - "${local.gce_prefix}-boot-disk"
    auto_delete = true
    source.image = var.image
    disk_size_gb = var.disk_size
    boot = true
    disk_encryption_key {
      kms_key_self_link = var.cmek_key
    }
    
 metadata = {
   sshKeys = var.ssk_keys
   SS_init_script = var.SS_init_script
   SS_project_id = var.project_name
   SS_dns_name = var.SS_dns_name
   SS_gcs_bucket = var.SS_gcs_bucket
 }
 service_account {
      email = "${abc}@${var.project_name}.iam.gserviceaccount.com"
    }
 
 resource "google_compute_region_instance_group_manager" "mig" {
  project = var.project_name
   name = "mig1"
   region = var.region
   
 base_instance_name = "${local.gce_prefix}-instance"
 }
 
 named_port {
   name = var.service_port_name
   port = var.service_port
 }
}
  
resource "googl_compute_region_bakcend_service" "backend" {
  project = var.project_name
  name = "abc-backend-service"
  region = var.region
  health_checks = [google_compute_health_check.health-check.self_link]
  
  backend {
    group = google_compute_region_instance_group_manager.mig.instance_group
  }
}
  
resource "google_compute_health_check" "health-check" {
  project = var.project_name
  name = "abc-hc"
  check_interval_sec = var.hc_interval
  timeout_sec = var.hc_timeout
  healthy_thresold = var.hc_healthy_thresold
  unhealthy_thresold = var.hc_unhealthy_thresold
  
  tcp_health_check {
    port = var.hc_port
  }
}
   
