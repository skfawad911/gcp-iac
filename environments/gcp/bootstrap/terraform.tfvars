organization_id = "366084230874"

region = "asia-south1"

billing_account_id = "0128B9-B1D953-5F4863"

core_services_name = "core-services"


network_project_name = "Network-Hub"

network_project_prefix = "network-hub"

network_name = "network-hub-vpc"


subnet1_name  = "network-hub-subnet-1"

subnet2_name = "network-hub-subnet-2"


subnet1_cidr  = "10.240.0.0/24"

subnet2_cidr = "10.240.1.0/24"




security_project_name = "Security-hub"

security_project_prefix = "security-hub"

logging_project_name = "Logging-hub"

logging_project_prefix = "logging-hub"

shared-services_project_name = "shared-services"

shared-services_project_prefix = "shared-services"


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
  "storage.googleapis.com",
  "bigquery.googleapis.com"
]

# IAM deny policies need v2 principal identifiers, not "group:"/"user:" syntax:
#   group -> principalSet://goog/group/GROUP_EMAIL
#   user  -> principal://goog/subject/USER_EMAIL
#   SA    -> principal://iam.googleapis.com/projects/-/serviceAccounts/SA_EMAIL
# Replace with your REAL admin group, and include whoever runs Terraform,
# otherwise the deny policy will block your own future IAM changes.
iam_admin_principals = [
  "principalSet://goog/group/gcp-platform-admins@example.com",
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
