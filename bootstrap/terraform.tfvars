organization_id = "xxxxxxxx"

region = "asia-south1"

billing_account_id = "xxxxxxx"

core_services_name = "core-services"


network_project_name = "Network-Hub"

network_project_prefix = "network-hub"

network_name = "network-hub-vpc"

network_hub_subnets = {
  subnet1 = {
    name          = "network-hub-subnet-1"
    region        = "asia-south1"
    ip_cidr_range = "10.241.0.0/24"
  }
 
  subnet2 = {
    name          = "network-hub-subnet-2"
    region        = "asia-south1"
    ip_cidr_range = "10.241.1.0/24"
  }
}




security_project_name = "Security-hub"

security_project_prefix = "security-hub"

security_network_name = "security-hub-vpc"

security_subnets = {
  subnet1 = {
    name          = "security-hub-subnet-1"
    region        = "asia-south1"
    ip_cidr_range = "10.241.2.0/25"
  }
 
  subnet2 = {
    name          = "security-hub-subnet-2"
    region        = "asia-south1"
    ip_cidr_range = "10.241.2.128/25"
  }
}

logging_project_name = "Logging-hub"

logging_project_prefix = "logging-hub"

shared-services_project_name = "shared-services"

shared-services_project_prefix = "shared-services"


shared-services_network_name = "shared-services-vpc"
 
shared-services_subnets = {

  subnet1 = {

    name          = "subnet-1"

    region        = "asia-south1"

    ip_cidr_range = "10.241.4.0/24"

  }
 
  

}
 


############################################################
# BIU WORKLOADS
############################################################

biu_workloads_name = "BIU-WORKLOADS"

biu_nonprod_name = "BIU-NONPROD"

biu_prod_name = "BIU-PROD"

biu_ai_name = "BIU-AI"


############################################################
# TECH WORKLOADS
############################################################

tech_workloads_name = "TECH-WORKLOADS"

tech_nonprod_name = "TECH-NONPROD"

tech_prod_name = "TECH-PROD"

############################################################
# BUSINESS WORKLOADS
############################################################

business_workloads_name = "BUSINESS-WORKLOADS"

business_nonprod_name = "BUSINESS-NONPROD"

business_prod_name = "BUSINESS-PROD"

############################################################
# ORGANIZATION POLICIES
############################################################

allowed_locations = [
  "in:asia-south1-locations"
]


cmek_services = [
  "compute.googleapis.com",

]

# IAM deny policies need v2 principal identifiers, not "group:"/"user:" syntax:
#   group -> principalSet://goog/group/GROUP_EMAIL
#   user  -> principal://goog/subject/USER_EMAIL
#   SA    -> principal://iam.googleapis.com/projects/-/serviceAccounts/SA_EMAIL
# Replace with your REAL admin group, and include whoever runs Terraform,
# otherwise the deny policy will block your own future IAM changes.
iam_admin_principals = [
  "principal://goog/subject/nitin.kamble@piramal.com",
  "principal://goog/subject/sahil.yelgonda@piramal.com",
  "principal://goog/subject/imran.sayyed@piramal.com", 
]


############################################################
# NETWORK CONNECTIVITY CENTER (NCC)
############################################################

ncc_hub_name           = "ncc-hub-prd"
ncc_preset_topology    = "MESH"
ncc_hub_vpc_spoke_name = "network-hub-vpc-spoke"


project_id            = "network-hub-06a139c8"
gcp_network_cidrs     = ["10.241.0.0/23"]
aws_vpc_cidrs         = ["172.28.0.0/16"]
gcp_allowed_tcp_ports = ["22", "443"]
aws_vpn_ip_1          = "13.202.212.244"
aws_vpn_ip_2          = "13.204.56.56"
shared_secret_1       = "HScISOmrW6fuRlQ3cGLYi7J2IKpW6RbX"
shared_secret_2       = "MC7x9unI0CI0dj5bl7YAaKYGWv3wvmnT"

project_folder_mapping = {
  # Cloud -infra poc -> core-services
  "cloudinfrapoc-481508" = {
    folder_id = "615810435557"
  }

  # LnD-Mumbai -> Businees Non prod
  "lnd-mumbai" = {
    folder_id = "196696859740"
  }

    # Non-Prod-Keys -> Tech Non Prod
  "non-prod-keys-465909" = {
    folder_id = "645662049760"
  }

    # Tech Pord -> Tech Prod
  "tech-prod-466307" = {
    folder_id = "1026748751891"
  }

   # BIU GEMINI -> BiU -AI
  "biu-gemini" = {
    folder_id = "463861966947"
  }

}

# cloudinfrapoc
cloudinfrapoc_project_id   = "cloudinfrapoc-481508"
cloudinfrapoc_project_name = "cloudinfrapoc"
cloudinfrapoc_network_name = "cloudinfra-vpc"
cloudinfrapoc_subnets = {
  subnet1 = {
    name          = "cloudinfra-subnet1"
    region        = "asia-south1"
    ip_cidr_range = "10.241.3.0/25"
  }
 
  subnet2 = {
    name          = "cloudinfra-subnet2"
    region        = "asia-south1"
    ip_cidr_range = "10.241.3.128/25"
  }
}

# Replace these values before running terraform plan or terraform apply.
hub_logging_project_id = "logging-hub-97894cc2"
log_bucket_location    = "asia-south1"
sink_filter            = "logName:\"cloudaudit.googleapis.com\""

# Add real users, groups, or service accounts before applying. Keep empty until
# the correct security group email is available.
iam_principals = []



service_account_project_id = "cloudinfrapoc-481508"

service_account_name = "vertex-ai-sa-piramal"

service_account_display_name = "Vertex AI Service Account"
 

psc_project_id = "network-hub-06a139c8"

user_id = "sahil.yelgonda@piramal.com"

psc_hub_project_id = "network-hub-06a139c8"

dns_project_id =   "network-hub-06a139c8"



network_projects = {
  "network-hub-06a139c8" = "network-hub-vpc"
  "security-hub-1f43f094" = "security-hub-vpc"
  "cloudinfrapoc-481508"  = "cloudinfra-vpc"
}

dns_admin_project_ids = [
  "security-hub-1f43f094",
  "cloudinfrapoc-481508"
]

psc_network_name = "network-hub-vpc"
psc_endpoint_name = "networkpschib"

psc_forwarding_rule_name = "pscforwardingrule"

psc_target_bundle = "all-apis"


# Private DNS zone for standard Google API hostnames.
dns_zone_name = "googleapis-private-zone"
dns_domain    = "googleapis.com."
dns_record_ttl = 300

psc_ip_cidr = "10.241.5.0/24"
psc_ip_host = 250
 


 
