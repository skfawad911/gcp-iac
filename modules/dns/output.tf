output "dns_zone_name" {
  description = "Private DNS zone name."
  value       = google_dns_managed_zone.googleapis.name
}
 
output "dns_zone_id" {
  description = "Private DNS zone ID."
  value       = google_dns_managed_zone.googleapis.id
}
 
output "psc_endpoint_ip" {
  description = "PSC endpoint IP used by DNS."
  value       = var.psc_endpoint_ip
}
 
output "attached_networks" {
  description = "VPC networks attached to the private DNS zone."
  value       = var.network_self_links
}