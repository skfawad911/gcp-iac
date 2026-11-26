locals {
  project_destination = "logging.googleapis.com/projects/${var.hub_logging_project_id}"
  bucket_destination  = "logging.googleapis.com/projects/${var.hub_logging_project_id}/locations/${var.log_bucket_location}/buckets/${var.log_bucket_id}"
}

resource "google_logging_project_bucket_config" "hub" {
  project        = var.hub_logging_project_id
  location       = var.log_bucket_location
  bucket_id      = var.log_bucket_id
  retention_days = var.log_bucket_retention_days
  description    = "Centralized log bucket for organization-intercepted logs."
}

resource "google_logging_organization_sink" "organization_sink" {
   name             = var.sink_name
   org_id    = var.organization_id
   include_children = true
   destination = "logging.googleapis.com/projects/${var.log_bucket_project_id}/locations/global/buckets/${var.log_bucket_name}"
   filter = "logName:\"cloudaudit.googleapis.com\""
}
 

resource "google_logging_project_sink" "audit_logs_to_bucket" {
  name                   = var.project_sink_id
  project                = var.hub_logging_project_id
  destination            = local.bucket_destination
  description            = "Routes intercepted audit logs from the hub project to the centralized log bucket."
  filter                 = var.sink_filter
  unique_writer_identity = true

  depends_on = [google_logging_project_bucket_config.hub]
}
module "iam" {
  source = "../iam"

  hub_logging_project_id      = var.hub_logging_project_id
  sink_writer_identity        = google_logging_organization_sink.organization_sink.writer_identity
  project_sink_writer_identity = google_logging_organization_sink.organization_sink.writer_identity
  iam_principals              = var.iam_principals
  grant_logging_config_writer = var.grant_logging_config_writer
  grant_logging_log_writer    = var.grant_logging_log_writer

  depends_on = [google_logging_organization_sink.organization_sink]
}

