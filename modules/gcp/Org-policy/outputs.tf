output "resource_locations_policy" {
  description = "Organization resource location policy"
  value       = google_org_policy_policy.resource_locations.name
}


output "storage_public_access_prevention_policy" {
  description = "Organization Cloud Storage public access prevention policy"
  value       = google_org_policy_policy.storage_public_access_prevention.name
}


output "cmek_policy" {
  description = "Organization CMEK policy"
  value       = google_org_policy_policy.restrict_non_cmek_services.name
}


output "disable_service_account_key_creation_policy" {
  description = "Organization service account key creation policy"
  value       = google_org_policy_policy.disable_service_account_key_creation.name
}


output "disable_service_account_key_upload_policy" {
  description = "Organization service account key upload policy"
  value       = google_org_policy_policy.disable_service_account_key_upload.name
}


output "kms_deny_policy" {
  description = "Organization KMS access deny policy"
  value       = google_iam_deny_policy.deny_user_kms_access.name
}


output "iam_deny_policy" {
  description = "Organization IAM administration deny policy"
  value       = google_iam_deny_policy.deny_iam_administration.name
}