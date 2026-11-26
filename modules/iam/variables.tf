variable "hub_logging_project_id" {
  description = "The project that owns the centralized log bucket."
  type        = string
}

variable "sink_writer_identity" {
  description = "Writer identity created for the organization log sink."
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

variable "project_sink_writer_identity" {
  description = "Writer identity created for the hub project sink."
  type        = string
}


