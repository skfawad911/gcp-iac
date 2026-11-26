output "psc_hub_dns_peer_project" {
  value = var.psc_hub_project_id
}

output "dns_admin_projects" {
  description = "Projects receiving DNS Admin."
  value       = var.dns_admin_project_ids
}

output "user_id" {
  value = var.user_id
}