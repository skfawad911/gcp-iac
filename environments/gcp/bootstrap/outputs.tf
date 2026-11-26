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
