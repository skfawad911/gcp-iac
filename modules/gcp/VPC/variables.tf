variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnet1_name" {
  description = "Subnet name"
  type        = string
}
variable "subnet2_name" {
  description = "Second subnet name"
  type        = string
}


variable "region" {
  description = "GCP region for the subnet"
  type        = string
}

variable "subnet1_cidr" {
  description = "Subnet IP CIDR range"
  type        = string
}
variable "subnet2_cidr" {
  description = "Second subnet IP CIDR range"
  type        = string
}
