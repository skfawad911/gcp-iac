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
  subnets      = var.network_hub_subnets

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
module "security_project_services" {
  source = "../modules/project-services"

  project_id = module.security_project.project_id

  services = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "networkconnectivity.googleapis.com",
    "securitycenter.googleapis.com"

  ]
    depends_on = [
    module.security_project
  ]
}


module "security_vpc" {
  source = "../modules/VPC"
 
  project_id   = module.security_project.project_id
  network_name = var.security_network_name
  subnets      = var.security_subnets
 
  depends_on = [
    module.security_project
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

module "logging_project_services" {
  source = "../modules/project-services"

  project_id = module.logging_project.project_id

  services = [
    

  ]
    depends_on = [
    module.security_project
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

module "shared_services_services" {
  source = "../modules/project-services"

  project_id = module.shared-services_project.project_id

  services = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "networkconnectivity.googleapis.com",
    "securitycenter.googleapis.com"

  ]
    depends_on = [
    module.shared-services_project
  ]
}

module "shared-services_vpc" {
  source = "../modules/VPC"
 
  project_id   = module.shared-services_project.project_id
  network_name = var.shared-services_network_name
  subnets      = var.shared-services_subnets
 
  depends_on = [
    module.shared_services_services
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

  preset_topology = "STAR"
 
   export_psc = true

  vpc_spokes = {

    (var.ncc_hub_vpc_spoke_name) = {

      network_self_link = module.network_hub_vpc.network_self_link

      description       = "Network hub VPC"

      group             = "center"

    }

  }
 
  depends_on = [

    module.network_hub_services,

    module.network_hub_vpc

  ]

}
 module "vpn_ha" {
  source = "../modules/vpn_ha"

  project_id = var.project_id
  region     = var.region
  network    = var.network_name
  name       = "gcp-aws-ha-vpn"

  router_asn = var.gcp_bgp_asn

  router_advertise_config = {
    mode   = "CUSTOM"
    groups = []
    ip_ranges = {
      for cidr in var.gcp_network_cidrs : cidr => "Advertised to AWS over HA VPN"
    }
  }

  peer_external_gateway = {
    redundancy_type = "TWO_IPS_REDUNDANCY"
    interfaces = [
      {
        id         = 0
        ip_address = var.aws_vpn_ip_1
      },
      {
        id         = 1
        ip_address = var.aws_vpn_ip_2
      }
    ]
  }

  tunnels = {
    tunnel-0 = {
      bgp_peer = {
        address = var.aws_bgp_ip_1
        asn     = var.aws_bgp_asn
      }
      bgp_peer_options                = null
      bgp_session_range               = var.gcp_bgp_ip_1
      ike_version                     = 2
      vpn_gateway_interface           = 0
      peer_external_gateway_interface = 0
      shared_secret                   = var.shared_secret_1
    }
    tunnel-1 = {
      bgp_peer = {
        address = var.aws_bgp_ip_2
        asn     = var.aws_bgp_asn
      }
      bgp_peer_options                = null
      bgp_session_range               = var.gcp_bgp_ip_2
      ike_version                     = 2
      vpn_gateway_interface           = 1
      peer_external_gateway_interface = 1
      shared_secret                   = var.shared_secret_2
    }
  }
}
module "existing_project" {
  source = "../modules/existing-project"
 
  for_each = var.project_folder_mapping
 
  project_id   = each.key
  folder_id    = each.value.folder_id
}

module "cloudinfrapoc" {
  source = "../modules/VPC"

  project_id   = data.google_project.cloudinfrapoc.project_id
  network_name = var.cloudinfrapoc_network_name
  subnets      = var.cloudinfrapoc_subnets

  depends_on = [
    module.cloudinfrapoc_services
  ]
}
module "cloudinfrapoc_services" {
  source = "../modules/project-services"
 
  project_id = data.google_project.cloudinfrapoc.project_id
 
  services = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}



module "scc" {
  source = "../modules/scc"
 
  organization_id = var.organization_id

  depends_on = [
    module.security_project_services
  ]
}

module "organization_logging" {
  source = "../modules/organization-logging"

  hub_logging_project_id    = var.hub_logging_project_id
  organization_id           = var.organization_id
  log_bucket_id             = var.log_bucket_id
  log_bucket_location       = var.log_bucket_location
  log_bucket_retention_days = var.log_bucket_retention_days
  sink_id                   = var.sink_id
  project_sink_id           = var.project_sink_id
  sink_filter               = var.sink_filter
  sink_description          = var.sink_description
  iam_principals            = var.iam_principals
  sink_name                 = var.sink_name
  log_bucket_name           = var.log_bucket_name
  log_bucket_project_id     = var.log_bucket_project_id

  grant_logging_config_writer = var.grant_logging_config_writer
  grant_logging_log_writer    = var.grant_logging_log_writer
}

module "service_account" {
  source = "../modules/service-account"

  service_account_project_id  = var.service_account_project_id
  service_account_name        = var.service_account_name
  service_account_display_name = var.service_account_display_name
}



module "psc" {
  source = "../modules/psc"

  psc_project_id       = var.psc_project_id
  endpoint_name        = var.psc_endpoint_name
  forwarding_rule_name = var.psc_forwarding_rule_name
  network_self_link    = data.google_compute_network.psc_network.self_link
 
  psc_target_bundle    = var.psc_target_bundle

  psc_ip_cidr = var.psc_ip_cidr
  psc_ip_host = var.psc_ip_host

  depends_on = [ module.iam_admin ]
}

module "dns" {
  source            = "../modules/dns"
  network_self_links = [
    for network in data.google_compute_network.dns_networks :
    network.self_link
  ]
  psc_endpoint_ip   = module.psc.endpoint_ip
  dns_zone_name     = var.dns_zone_name
  dns_domain        = var.dns_domain
  dns_record_ttl    = var.dns_record_ttl
  dns_project_id    = var.dns_project_id


  depends_on = [module.psc, module.iam_admin]
}

module "iam_admin" {
  source = "../modules/iam_admin"

  user_id            = var.user_id
  psc_hub_project_id = var.psc_hub_project_id
  dns_admin_project_ids = var.dns_admin_project_ids
}