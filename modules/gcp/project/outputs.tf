output "project_id" {
  description = "Generated GCP project ID"
  value       = google_project.this.project_id
}

output "project_number" {
  description = "GCP project number"
  value       = google_project.this.number
}

output "project_name" {
  description = "GCP project display name"
  value       = google_project.this.name
}