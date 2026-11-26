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
variable "security_network_name" {
  description = "Name of the security network to be created"
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
variable "shared-services_network_name" {
  description = "Name of the shared network to be created"
  type        = string
}

variable "network_hub_subnets" {
  type = map(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
}

variable "security_subnets" {
  type = map(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
}
variable "shared-services_subnets" {
  type = map(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
}
variable "cloudinfrapoc_subnets" {
  type = map(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
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


variable "project_id" {
  type        = string
  description = "GCP Project ID."
}


variable "gcp_network_cidrs" {
  type        = list(string)
  default     = ["10.240.0.0/23"]
  description = "CIDR ranges in GCP that should be advertised to AWS over BGP."
}

variable "gcp_bgp_asn" {
  type        = number
  default     = 65000
  description = "BGP Autonomous System Number for GCP Cloud Router."
}

variable "aws_bgp_asn" {
  type        = number
  default     = 64512
  description = "BGP Autonomous System Number for AWS side."
}

variable "aws_vpn_ip_1" {
  type        = string
  description = "Public IP address of AWS VPN Tunnel 1 Endpoint."
}

variable "aws_vpn_ip_2" {
  type        = string
  description = "Public IP address of AWS VPN Tunnel 2 Endpoint."
}

variable "aws_vpc_cidrs" {
  type        = list(string)
  description = "AWS VPC CIDR ranges allowed to reach GCP workloads and used as GCP egress destinations."
}

variable "gcp_firewall_target_tags" {
  type        = list(string)
  default     = []
  description = "Optional GCP instance network tags to which the AWS rules apply. Empty applies to all instances."
}

variable "gcp_allowed_tcp_ports" {
  type        = list(string)
  default     = []
  description = "TCP ports allowed between the AWS VPC CIDRs and tagged GCP instances."
}

variable "gcp_allowed_udp_ports" {
  type        = list(string)
  default     = []
  description = "UDP ports allowed between the AWS VPC CIDRs and tagged GCP instances."
}

variable "shared_secret_1" {
  type        = string
  sensitive   = true
  description = "Pre-shared key for Tunnel 1."
}

variable "shared_secret_2" {
  type        = string
  sensitive   = true
  description = "Pre-shared key for Tunnel 2."
}

variable "gcp_bgp_ip_1" {
  type    = string
  default = "169.254.251.202/30"
}

variable "aws_bgp_ip_1" {
  type    = string
  default = "169.254.251.201"
}

variable "gcp_bgp_ip_2" {
  type    = string
  default = "169.254.185.242/30"
}

variable "aws_bgp_ip_2" {
  type    = string
  default = "169.254.185.241"
}

variable "project_folder_mapping" {
  description = "Existing GCP projects mapped to destination folders"
 
  type = map(object({
    folder_id    = string
  }))
}

variable "cloudinfrapoc_project_id" {
  type = string
}
variable "cloudinfrapoc_project_name" {
  type = string
}

variable "cloudinfrapoc_network_name" {
  type = string
}

variable "hub_logging_project_id" {
  description = "GCP project ID that owns the centralized log bucket."
  type        = string
}


variable "log_bucket_id" {
  description = "Centralized log bucket ID."
  type        = string
  default     = "organization-intercepted-logs"
}

variable "log_bucket_project_id" {
  description = "Centralized log project ID."
  type        = string
  default     = "logging-hub-97894cc2"
} 

variable "log_bucket_name" {
  description = "Centralized log bukcet name ."
  type        = string
  default     = "pfl-centralized-logging-bucket"
} 

variable "log_bucket_location" {
  description = "Log bucket region or multi-region."
  type        = string
  default     = "asia-south1"
}

variable "log_bucket_retention_days" {
  description = "Log retention period in days."
  type        = number
  default     = 365

  validation {
    condition     = var.log_bucket_retention_days >= 1
    error_message = "log_bucket_retention_days must be at least 1."
  }
}

variable "sink_name" {

  type        = string

  description = "The name of the organization log sink."
  
  default = "orgnization_audit_logs_sink"
}
 
variable "sink_id" {
  description = "Organization sink ID."
  type        = string
  default     = "organization-intercepted-sink"
}

variable "sink_filter" {
  description = "Cloud Logging filter for audit logs."
  type        = string
  default     = "logName:\"cloudaudit.googleapis.com\""
}

variable "sink_description" {
  description = "Organization sink description."
  type        = string
  default     = "Organization intercepted sink to the hub logging project."
}

variable "iam_principals" {
  description = "Principals receiving the requested IAM roles."
  type        = set(string)
  default     = []

  validation {
    condition = alltrue([
      for principal in var.iam_principals : !strcontains(principal, "REPLACE_WITH")
    ])
    error_message = "iam_principals contains a placeholder. Replace it with a real user, group, or service account email before applying."
  }
}

variable "grant_logging_config_writer" {
  description = "Grant roles/logging.configWriter to iam_principals."
  type        = bool
  default     = true
}

variable "grant_logging_log_writer" {
  description = "Grant roles/logging.logWriter to iam_principals."
  type        = bool
  default     = true
}

variable "project_sink_id" {
  description = "Hub project sink ID that routes intercepted audit logs to the bucket."
  type        = string
  default     = "hub-audit-logs-to-bucket"
}

variable "service_account_project_id" {
  description = "Name of the service account project id "
  type        = string
}

variable "service_account_name" {
  description = "Name of the service account"
  type        = string
}

variable "service_account_display_name" {
  description = "Display name of the service account"
  type        = string
}

 variable "psc_project_id" {
  description = "Google Cloud project containing the existing VPC and where PSC and DNS resources are created."
  type        = string

}

variable "network_projects" {
  description = "Existing GCP projects and their VPC network names."
  type        = map(string)
}

variable "psc_endpoint_name" {
  description = "Name of the global forwarding rule used as the PSC endpoint."
  type        = string
  default     = "samplegooglepsc"
}

variable "endpoint_address_name" {
  description = "Name of the reserved global internal IP address for the PSC endpoint."
  type        = string
  default     = "google-apis-psc-address"
}

variable "psc_endpoint_ip" {
  description = "Optional reserved internal IP address for the PSC endpoint. Leave null to have Google Cloud allocate one."
  type        = string
  default     = null
  nullable    = true
}

variable "psc_target_bundle" {
  description = "Google APIs bundle targeted by the PSC endpoint."
  type        = string
  default     = "all-apis"

  validation {
    condition     = contains(["all-apis", "vpc-sc"], var.psc_target_bundle)
    error_message = "psc_target_bundle must be either all-apis or vpc-sc."
  }
}

variable "dns_zone_name" {
  description = "Name of the private Cloud DNS managed zone for Google APIs."
  type        = string
  default     = "google-apis-private"
}

variable "dns_domain" {
  description = "DNS domain served by the private zone. Include the trailing dot."
  type        = string
  default     = "googleapis.com."

  validation {
    condition     = endswith(var.dns_domain, ".")
    error_message = "dns_domain must be a fully-qualified DNS name ending in a dot."
  }
}

variable "dns_record_ttl" {
  description = "TTL, in seconds, for the private Google APIs A records."
  type        = number
  default     = 300

  validation {
    condition     = var.dns_record_ttl > 0
    error_message = "dns_record_ttl must be greater than zero."
  }
}
variable "psc_forwarding_rule_name" {
  type = string
}



variable "psc_ip_cidr" {
  description = "CIDR used for PSC endpoint IP allocation"
  type        = string
}

variable "psc_ip_host" {
  description = "Host number used for PSC endpoint IP allocation"
  type        = number
}

variable "psc_network_name" {
  description = "VPC network where the PSC endpoint is created."
  type        = string
}

variable "user_id" {
  description = "Google user email."
  type        = string
}

variable "psc_hub_project_id" {
  description = "PSC Hub project."
  type        = string
}

variable "dns_project_id" {
  description = "Projects where DNS Admin is required."
  type        = string
}

variable "dns_admin_project_ids" {
  description = "Spoke projects where DNS Admin is required."
  type        = set(string)
}

