############################################################
# CORE SERVICES FOLDER
############################################################
/*
module "core_services" {

 source = "../modules/folder"

  folder_name = var.foldername

 parent = "organizations/${var.organization_id}"


}*/


module "core_services" {

  source = "../modules/folder"

  folder_name = var.core_services_name

  parent = "organizations/${var.organization_id}"
}



############################################################
# BIU WORKLOADS
############################################################

module "biu_workloads" {

  source = "../modules/folder"

  folder_name = var.biu_workloads_name

  parent = "organizations/${var.organization_id}"
}

############################################################
# BIU NON-PROD
############################################################

module "biu_nonprod" {

  source = "../modules/folder"

  folder_name = var.biu_nonprod_name

  parent = module.biu_workloads.folder_id

  depends_on = [
    module.biu_workloads
  ]
}

############################################################
# BIU PROD
############################################################

module "biu_prod" {

  source = "../modules/folder"

  folder_name = var.biu_prod_name

  parent = module.biu_workloads.folder_id

  depends_on = [
    module.biu_workloads
  ]
}



############################################################
# BIU AI
############################################################

module "biu_ai" {

  source = "../modules/folder"

  folder_name = var.biu_ai_name

  parent = module.biu_workloads.folder_id

  depends_on = [
    module.biu_workloads
  ]
}


############################################################
# TECH WORKLOADS
############################################################

module "tech_workloads" {

  source = "../modules/folder"

  folder_name = var.tech_workloads_name

  parent = "organizations/${var.organization_id}"
}

############################################################
# TECH NON-PROD
############################################################

module "tech_nonprod" {

  source = "../modules/folder"

  folder_name = var.tech_nonprod_name

  parent = module.tech_workloads.folder_id

  depends_on = [
    module.tech_workloads
  ]
}

############################################################
# TECH PROD
############################################################

module "tech_prod" {

  source = "../modules/folder"

  folder_name = var.tech_prod_name

  parent = module.tech_workloads.folder_id

  depends_on = [
    module.tech_workloads
  ]
}

############################################################
# BUSINESS WORKLOADS
############################################################

module "business_workloads" {

  source = "../modules/folder"

  folder_name = var.business_workloads_name

  parent = "organizations/${var.organization_id}"
}

############################################################
# BUSINESS NON-PROD
############################################################

module "business_nonprod" {

  source = "../modules/folder"

  folder_name = var.business_nonprod_name

  parent = module.business_workloads.folder_id

  depends_on = [
    module.business_workloads
  ]
}

############################################################
# BUSINESS PROD
############################################################

module "business_prod" {

  source = "../modules/folder"

  folder_name = var.business_prod_name

  parent = module.business_workloads.folder_id

  depends_on = [
    module.business_workloads
  ]
}

############################################################
# NETWORK HUB PROJECT
############################################################

module "network_hub_project" {

  source = "../modules/project"

  project_name = var.network_project_name

  project_prefix = var.network_project_prefix

  folder_id          = module.core_services.folder_id
  billing_account_id = var.billing_account_id

  depends_on = [
    module.core_services
  ]
}
module "network_hub_services" {
  source = "../modules/project-services"

  project_id = module.network_hub_project.project_id

  services = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "networkconnectivity.googleapis.com"
  ]

  depends_on = [
    module.network_hub_project
  ]
}
module "network_hub_vpc" {
  source = "../modules/VPC"

  project_id   = module.network_hub_project.project_id
  network_name = var.network_name
  region       = var.region

  subnet1_name = var.subnet1_name
  subnet1_cidr = var.subnet1_cidr

  # Second subnet
  subnet2_name = var.subnet2_name
  subnet2_cidr = var.subnet2_cidr

  depends_on = [
    module.network_hub_services
  ]
}

###########################################################
# SECURITY PROJECT
###########################################################

module "security_project" {

  source = "../modules/project"

  project_name = var.security_project_name

  project_prefix = var.security_project_prefix

  folder_id          = module.core_services.folder_id
  billing_account_id = var.billing_account_id

  depends_on = [
    module.core_services
  ]
}


############################################################
# LOGGING PROJECT
############################################################

module "logging_project" {

  source = "../modules/project"

  project_name = var.logging_project_name

  project_prefix = var.logging_project_prefix

  folder_id          = module.core_services.folder_id
  billing_account_id = var.billing_account_id


  depends_on = [
    module.core_services
  ]
}

############################################################
# Shared-services PROJECT
############################################################

module "shared-services_project" {

  source = "../modules/project"

  project_name = var.shared-services_project_name

  project_prefix = var.shared-services_project_prefix

  folder_id          = module.core_services.folder_id
  billing_account_id = var.billing_account_id


  depends_on = [
    module.core_services
  ]
}

module "org_policies" {
  source = "../modules/Org-policy"

  organization_id      = var.organization_id
  allowed_locations    = var.allowed_locations
  cmek_services        = var.cmek_services
  iam_admin_principals = var.iam_admin_principals
}

############################################################
# NETWORK CONNECTIVITY CENTER (NCC)
############################################################

module "network_hub_ncc" {
  source = "../modules/NCC"

  project_id      = module.network_hub_project.project_id
  hub_name        = var.ncc_hub_name
  hub_description = "Landing zone NCC hub"
  preset_topology = var.ncc_preset_topology

  # Add workload VPCs here as they are created
  vpc_spokes = {
    (var.ncc_hub_vpc_spoke_name) = {
      network_self_link = module.network_hub_vpc.network_self_link
      description       = "Network hub VPC"
      group             = var.ncc_preset_topology == "STAR" ? "center" : null
    }
  }

  depends_on = [
    module.network_hub_services,
    module.network_hub_vpc
  ]
}

