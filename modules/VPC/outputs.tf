output "network_name" {
  description = "VPC network name"
  value       = google_compute_network.this.name
}

output "network_id" {
  description = "VPC network ID"
  value       = google_compute_network.this.id
}

output "network_self_link" {
  description = "VPC network self link"
  value       = google_compute_network.this.self_link
}

output "subnets" {
  description = "Created subnet details"

  value = {
    for key, subnet in google_compute_subnetwork.this : key => {
      name          = subnet.name
      id            = subnet.id
      self_link     = subnet.self_link
      region        = subnet.region
      ip_cidr_range = subnet.ip_cidr_range
    }
  }
}