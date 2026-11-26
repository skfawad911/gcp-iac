output "folder_id" {
  description = "GCP folder ID"
  value       = google_folder.this.name
}

output "folder_name" {
  description = "GCP folder name"
  value       = google_folder.this.display_name
}