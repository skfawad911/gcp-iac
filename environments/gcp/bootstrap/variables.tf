variable "organization_id" {
  description = "GCP Organization ID"
  type        = string
}

variable "region" {
  description = "Default GCP region"
  type        = string
  default     = "asia-south1"
}
variable "billing_account_id" {
  description = "GCP Billing Account ID"
  type        = string
}
variable "core_services_name" {
  description = "Core Services folder name"
  type        = string
}
variable "network_project_name" {
  description = "Name of the project to be created"
  type        = string
}
variable "network_project_prefix" {
  description = "Prefix for the project name"
  type        = string
}
variable "network_name" {
  description = "Name of the network to be created"
  type        = string
}
variable "security_project_name" {
  description = "Name of the security project to be created"
  type        = string
}
variable "security_project_prefix" {
  description = "Prefix for the security project name"
  type        = string
}
variable "logging_project_name" {
  description = "Name of the logging project to be created"
  type        = string
}
variable "logging_project_prefix" {
  description = "Prefix for the logging project name"
  type        = string
}
variable "shared-services_project_name" {
  description = "Name of the shared-services project to be created"
  type        = string
}
variable "shared-services_project_prefix" {
  description = "Prefix for the shared services project name"
  type        = string
}
variable "subnet1_name" {
  description = "Name of the first subnet to be created"
  type        = string
}

variable "subnet2_name" {
  description = "Name of the second subnet to be created"
  type        = string
}


variable "subnet1_cidr" {
  description = "CIDR range for the first subnet"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR range for the second subnet"
  type        = string
}

############################################################
# BIU WORKLOADS
############################################################

variable "biu_workloads_name" {
  description = "BIU Workloads folder"
  type        = string
}

variable "biu_nonprod_name" {
  description = "BIU Non-Prod folder"
  type        = string
}

variable "biu_prod_name" {
  description = "BIU Prod folder"
  type        = string
}

variable "biu_ai_name" {
  description = "BIU AI folder"
  type        = string
}


############################################################
# TECH WORKLOADS
############################################################

variable "tech_workloads_name" {
  description = "TECH Workloads folder"
  type        = string
}

variable "tech_nonprod_name" {
  description = "TECH Non-Prod folder"
  type        = string
}

variable "tech_prod_name" {
  description = "TECH Prod folder"
  type        = string
}

############################################################
# BUSINESS WORKLOADS
############################################################

variable "business_workloads_name" {
  description = "business Workloads folder"
  type        = string
}

variable "business_nonprod_name" {
  description = "business Non-Prod folder"
  type        = string
}

variable "business_prod_name" {
  description = "business Prod folder"
  type        = string
}

############################################################
# ORGANIZATION POLICIES
############################################################

variable "allowed_locations" {
  description = "Allowed GCP resource locations"
  type        = list(string)
}

variable "cmek_services" {
  description = "Services that require CMEK"
  type        = list(string)
}

variable "iam_admin_principals" {
  description = "Approved IAM administrator principals"
  type        = list(string)
  default     = []
}


############################################################
# NETWORK CONNECTIVITY CENTER (NCC)
############################################################

variable "ncc_hub_name" {
  description = "NCC hub name"
  type        = string
}

variable "ncc_preset_topology" {
  description = "NCC hub topology: MESH or STAR"
  type        = string
  default     = "MESH"
}

variable "ncc_hub_vpc_spoke_name" {
  description = "NCC spoke name for the network hub VPC"
  type        = string
}




