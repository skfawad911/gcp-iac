variable "user_id" {
  description = "Google user email."
  type        = string
}

variable "psc_hub_project_id" {
  description = "Project where the PSC hub is created."
  type        = string
}

variable "dns_admin_project_ids" {
  description = "Existing projects where DNS Admin role is required."
  type        = set(string)
}