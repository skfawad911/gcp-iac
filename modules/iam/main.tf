locals {
  requested_roles = toset(concat(
    var.grant_logging_config_writer ? ["roles/logging.configWriter"] : [],
    var.grant_logging_log_writer ? ["roles/logging.logWriter"] : [],
  ))
}
 
resource "google_project_iam_member" "requested_roles" {
  for_each = {
    for pair in setproduct(var.iam_principals, local.requested_roles) :
    "${pair[0]}|${pair[1]}" => {
      member = pair[0]
      role   = pair[1]
    }
  }
 
  project = var.hub_logging_project_id
  role    = each.value.role
  member  = each.value.member
}
 
resource "google_project_iam_member" "organization_sink_log_writer" {
  project = var.hub_logging_project_id
  role    = "roles/logging.logWriter"
  member  = var.sink_writer_identity
}
 
resource "google_project_iam_member" "project_sink_bucket_writer" {
  project = var.hub_logging_project_id
  role    = "roles/logging.bucketWriter"
  member  = var.project_sink_writer_identity
}