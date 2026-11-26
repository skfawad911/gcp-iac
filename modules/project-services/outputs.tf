output "enabled_services" {
  description = "List of APIs enabled on the project"
  value       = [for service in google_project_service.services : service.service]
}