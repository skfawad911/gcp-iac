resource "google_compute_network" "this" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  for_each = var.subnets

  name          = each.value.name
  project       = var.project_id
  region        = each.value.region
  network       = google_compute_network.this.id
  ip_cidr_range = each.value.ip_cidr_range
}