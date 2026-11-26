output "core_services_folder_id" {
  value = module.core_services.folder_id
}

output "network_hub_project_id" {
  value = module.network_hub_project.project_id
}

output "network_hub_project_number" {
  value = module.network_hub_project.project_number
}
output "network_hub_vpc_id" {
  value = module.network_hub_vpc.network_id
}

output "network_hub_vpc_name" {
  value = module.network_hub_vpc.network_name
}
output "network_hub_enabled_services" {
  value = module.network_hub_services.enabled_services
}

output "security_project_id" {
  value = module.security_project.project_id
}

output "security_project_number" {
  value = module.security_project.project_number
}

output "security_vpc_id" {
  value = module.security_vpc.network_id
}

output "security_vpc_name" {
  value = module.security_vpc.network_name
}

output "logging_project_id" {
  value = module.logging_project.project_id
}

output "logging_project_number" {
  value = module.logging_project.project_number
}

output "shared-services_project_id" {
  value = module.shared-services_project.project_id
}

output "shared-services_project_number" {
  value = module.shared-services_project.project_number
}
output "shared-services_vpc_name" {
  value = module.shared-services_vpc.network_name
}

############################################################
# BIU WORKLOADS
############################################################

output "biu_workloads_folder_id" {
  value = module.biu_workloads.folder_id
}

output "biu_nonprod_folder_id" {
  value = module.biu_nonprod.folder_id
}

output "biu_prod_folder_id" {
  value = module.biu_prod.folder_id
}

output "biu_ai_folder_id" {
  value = module.biu_ai.folder_id
}

############################################################
# TECH WORKLOADS
############################################################

output "tech_workloads_folder_id" {
  value = module.tech_workloads.folder_id
}

output "tech_nonprod_folder_id" {
  value = module.tech_nonprod.folder_id
}

output "tech_prod_folder_id" {
  value = module.tech_prod.folder_id
}

############################################################
# BUSINESS WORKLOADS
############################################################

output "business_workloads_folder_id" {
  value = module.business_workloads.folder_id
}

output "business_nonprod_folder_id" {
  value = module.business_nonprod.folder_id
}

output "business_prod_folder_id" {
  value = module.business_prod.folder_id
}
output "vpn_gateway_self_link" {
  description = "Self-link of the HA VPN gateway."
  value       = module.vpn_ha.self_link
}

output "vpn_router_name" {
  description = "Name of the Cloud Router used by HA VPN."
  value       = module.vpn_ha.router_name
}

output "vpn_tunnel_names" {
  description = "Names of the HA VPN tunnels."
  value       = module.vpn_ha.tunnel_names
}
output "managed_projects" {
  description = "Existing GCP projects managed by Terraform"
 
  value = {
    for project_id, project in module.existing_project :
    project_id => {
      folder_id    = project.folder_id
    }
  }
}

output "cloudinfrapoc_vpc_name" {
  value = module.cloudinfrapoc.network_name
}
 

output "log_bucket_name" {
  value = module.organization_logging.log_bucket_name
}

output "sink_name" {
  value = module.organization_logging.sink_name
}

output "sink_writer_identity" {
  value = module.organization_logging.sink_writer_identity
}

output "project_sink_name" {
  value = module.organization_logging.project_sink_name
}

output "service_account_id" {
  description = "ID of the created service account"
  value       = module.service_account.service_account_id
}

output "service_account_email" {
  description = "Email address of the created service account"
  value       = module.service_account.service_account_email
}

output "service_account_name" {
  description = "Full resource name of the service account"
  value       = module.service_account.service_account_name
}

output "assigned_role" {
  description = "IAM role assigned to the service account"
  value       = module.service_account.assigned_role
}

output "psc_endpoint_ip" {
  description = "Automatically allocated PSC endpoint IP"
  value       = module.psc.endpoint_ip
}

output "psc_endpoint_name" {
  description = "PSC endpoint name"
  value       = module.psc.endpoint_name
}

output "psc_endpoint_address_id" {
  description = "PSC endpoint address ID"
  value       = module.psc.endpoint_address_id
}

output "psc_forwarding_rule_name" {
  description = "PSC forwarding rule name"
  value       = module.psc.forwarding_rule_name
}
