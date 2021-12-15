output "application" {
  value = element(google_compute_instance_template.linux.*.application)
}
