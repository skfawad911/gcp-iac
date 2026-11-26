variable "hub_logging_project_id" {
  description = "The project that owns the centralized log bucket."
  type        = string
}

variable "organization_id" {
  description = "The numeric organization ID that owns the organization sink."
  type        = string
}

variable "log_bucket_id" {
  description = "The ID of the centralized log bucket."
  type        = string
}

variable "log_bucket_location" {
  description = "The region or multi-region for the log bucket."
  type        = string
}

variable "log_bucket_retention_days" {
  description = "Number of days to retain logs in the centralized bucket."
  type        = number
}

variable "sink_id" {
  description = "The ID of the organization-level intercepted sink."
  type        = string
}

variable "project_sink_id" {
  description = "The ID of the hub project sink that routes intercepted logs to the bucket."
  type        = string
}

variable "sink_filter" {
  description = "Cloud Logging filter for audit logs."
  type        = string
  default     = "logName:\"cloudaudit.googleapis.com\""
}

variable "sink_description" {
  description = "Description for the organization sink."
  type        = string
}

variable "iam_principals" {
  description = "Principals receiving the requested administration roles."
  type        = set(string)
}

variable "grant_logging_config_writer" {
  description = "Whether to grant roles/logging.configWriter."
  type        = bool
}

variable "grant_logging_log_writer" {
  description = "Whether to grant roles/logging.logWriter."
  type        = bool
}

variable "sink_name" {

  type        = string

  description = "The name of the organization log sink."

}

variable "log_bucket_project_id" {
  description = "Project ID containing the destination log bucket"
  type        = string
}
 
variable "log_bucket_name" {
  description = "Destination log bucket name"
  type        = string
}
 
variable "org_log_sink_filter" {
  description = "Organization log sink filter"
  type        = string
 
  default = "logName:\"cloudaudit.googleapis.com\""
}
 