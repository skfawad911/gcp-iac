output "hub_id" {
  description = "NCC hub ID"
  value       = google_network_connectivity_hub.this.id
}

output "hub_name" {
  description = "NCC hub name"
  value       = google_network_connectivity_hub.this.name
}

output "vpc_spoke_ids" {
  description = "NCC VPC spoke IDs, keyed by spoke name"
  value       = { for k, s in google_network_connectivity_spoke.vpc : k => s.id }
}