# modules/SCC/variables.tf

variable "organization_id" {
  description = "GCP Organization ID"
  type        = string
}
variable "scc_display_name" {
  description = "SCC source display name"
  type        = string
  default     = "Landing Zone SCC Source"
}
 

