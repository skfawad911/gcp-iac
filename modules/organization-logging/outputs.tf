output "log_bucket_name" {
  description = "Fully qualified name of the centralized log bucket."
  value       = google_logging_project_bucket_config.hub.name
}

output "log_bucket_destination" {
  description = "Logging sink destination for the centralized bucket."
  value       = local.bucket_destination
}

output "sink_name" {
  description = "The organization sink name."
  value       = google_logging_organization_sink.organization_sink.name
}

output "sink_writer_identity" {
  description = "Writer identity granted roles/logging.bucketWriter."
  value       = google_logging_organization_sink.organization_sink.writer_identity

}

output "project_sink_name" {
  description = "The hub project sink that routes audit logs to the centralized bucket."
  value       = google_logging_project_sink.audit_logs_to_bucket.name
}

output "writer_identity" {
  value = google_logging_organization_sink.organization_sink.writer_identity
}


 