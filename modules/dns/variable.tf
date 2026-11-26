variable "dns_project_id" {

  description = "Project where the private DNS zone is created."

  type        = string

}

 
variable "network_self_links" {

  description = "Existing VPC networks that should be attached to the private DNS zone."

  type        = set(string)

}
 
variable "dns_zone_name" {

  description = "Private DNS managed zone name."

  type        = string

}
 
variable "dns_domain" {

  description = "DNS domain for the private zone."

  type        = string

}
 
variable "dns_record_ttl" {

  description = "DNS record TTL."

  type        = number

  default     = 300

}
 
variable "psc_endpoint_ip" {

  description = "PSC endpoint IP address."

  type        = string

}
 