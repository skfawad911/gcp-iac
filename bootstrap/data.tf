data "google_compute_network" "psc_network" {
  name    = var.psc_network_name
  project = var.psc_project_id
}
 
data "google_compute_network" "dns_networks" {
  for_each = var.network_projects
 
  name    = each.value
  project = each.key
}
 
data "google_project" "dns_projects" {
  for_each = var.network_projects
 
  project_id = each.key
}