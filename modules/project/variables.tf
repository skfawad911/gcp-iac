variable "project_name" {
  description = "GCP project display name"
  type        = string
}

variable "project_prefix" {
  description = "Prefix used to generate the unique GCP project ID"
  type        = string
}

variable "folder_id" {
  description = "Parent GCP folder ID"
  type        = string
}
variable "billing_account_id" {
  description = "GCP Billing Account ID"
  type        = string
}
