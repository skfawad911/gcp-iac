variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"

  type = map(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))

  default = {}
}