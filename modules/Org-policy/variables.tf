variable "organization_id" {
  description = "GCP Organization ID"
  type        = string
}


variable "allowed_locations" {
  description = "Allowed GCP resource locations"
  type        = list(string)
}


variable "cmek_services" {
  description = "Google Cloud services that must use CMEK"
  type        = list(string)
}


variable "iam_admin_principals" {
  description = "Principals allowed to administer IAM"
  type        = list(string)
  default     = []

  validation {
    condition = alltrue([
      for p in var.iam_admin_principals :
      startswith(p, "principal://") || startswith(p, "principalSet://")
    ])
    error_message = "iam_admin_principals must use IAM v2 identifiers, e.g. principalSet://goog/group/admins@example.com or principal://goog/subject/user@example.com (not group:/user:)."
  }
}