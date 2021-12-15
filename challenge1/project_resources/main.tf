module "app-vm" {
  source = "../../module/mig_dualnic"
  application = "tier3-app"
  project_name = local.project_name
  subnetwork = var.subnetwork
  subnetwkr1 = var.subnetwork1
  ip_address = "<ip address>"
  cmek_key = var.cmek_key
  image = var.app_image
  machine_type = var.machine_type
  SS_init_script = "init.script.bash"
  SS_env = "Dev"
}

## like that we can write all required variables to create MIG, Template and dual NIC VM
  
