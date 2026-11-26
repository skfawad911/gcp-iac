output "network_id" {
  description = "VPC network ID"
  value       = google_compute_network.this.id
}

output "network_name" {
  description = "VPC network name"
  value       = google_compute_network.this.name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.this.id
}

output "subnet_name" {
  description = "Subnet name"
  value       = google_compute_subnetwork.this.name
}


output "subnet2_id" {
  description = "Second subnet ID"
  value       = google_compute_subnetwork.subnet2.id
}

output "subnet2_name" {
  description = "Second subnet name"
  value       = google_compute_subnetwork.subnet2.name
}

output "network_self_link" {
  description = "Self-link URI of the VPC network"
  value       = google_compute_network.this.self_link
}