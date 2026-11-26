# GCP Landing Zone Bootstrap

This repository contains Terraform code for setting up a minimal Google Cloud landing zone foundation in an organization. It provisions a parent folder, creates a few core GCP projects, enables required Google APIs, and creates a base VPC/subnet for the network hub.

## Overview

The bootstrap configuration creates the following foundational resources:

- A top-level folder under the GCP organization
- A Network Hub project
- A Security project
- A Logging project
- A VPC and subnet in the Network Hub project
- Enabled Google APIs for the network project

This is a starter landing zone pattern intended to be extended with additional projects, IAM policies, shared VPCs, firewall rules, monitoring, and application workloads.

## Repository Structure

```text
.
├── bootstrap/                 # Root Terraform configuration
│   ├── main.tf                # Landing zone composition
│   ├── variables.tf           # Bootstrap variables
│   ├── outputs.tf             # Output values
│   ├── terraform.tfvars       # Sample variable values
│   └── versions.tf            # Provider and Terraform version requirements
├── modules/
│   ├── folder/                # Folder creation module
│   ├── project/               # Project creation module
│   ├── project-services/      # API enablement module
│   └── VPC/                   # VPC and subnet module
└── README.md                  # Project documentation
```

## Architecture

The bootstrap stack is organized around a few reusable Terraform modules:

- `modules/folder` creates a Google Folder under the organization
- `modules/project` creates a GCP project and assigns it to the folder
- `modules/project-services` enables Google APIs on a project
- `modules/VPC` creates a custom VPC and subnet

The main bootstrap configuration wires these modules together with the following pattern:

1. Create a core services folder
2. Create projects for network, security, and logging
3. Enable required services in the network project
4. Create a VPC and two subnets in the network project

## Prerequisites

Before running this project, ensure you have:

- Terraform version `>= 1.6.0`
- A Google Cloud organization ID
- A valid Google Cloud billing account ID
- Permissions to create folders, projects, and billing associations
- Google Cloud credentials configured for Terraform (`gcloud auth application-default login` or equivalent service account setup)

## Required Configuration

Update the values in `bootstrap/terraform.tfvars` before deployment:

```hcl
organization_id = "YOUR_ORGANIZATION_ID"
region = "asia-south1"
billing_account_id = "YOUR_BILLING_ACCOUNT_ID"
foldername = "testing-services"
```

Also update the subnet names and CIDR ranges in `bootstrap/terraform.tfvars`:

```hcl
subnet_name  = "network-hub-subnet-1"
subnet2_name = "network-hub-subnet-2"
subnet_cidr  = "10.10.0.0/24"
subnet2_cidr = "10.20.0.0/24"
```

Use valid, non-overlapping private CIDR ranges that fit your network design.

## Remote State Backend (GCS)

This project is configured to store Terraform state in a Google Cloud Storage bucket using the GCS backend.

Before running Terraform for the first time, create the bucket in GCP and update the values in `bootstrap/backend.hcl`:

```hcl
bucket = "your-gcp-tfstate-bucket"
prefix = "landingzone/bootstrap"
```

The backend block in `bootstrap/versions.tf` remains generic:

```hcl
backend "gcs" {}
```

Example bucket creation:

```bash
gcloud storage buckets create gs://your-gcp-tfstate-bucket \
  --location=asia-south1 \
  --uniform-bucket-level-access
```

Then initialize Terraform with the remote backend config:

```bash
cd bootstrap
terraform init -reconfigure -backend-config=backend.hcl
terraform plan
terraform apply
```

## Deployment Steps

From the repository root, run:

```bash
cd bootstrap
terraform init -reconfigure -backend-config=backend.hcl
terraform plan
terraform apply
```

When prompted, confirm the apply operation. After successful deployment, Terraform will output values such as:

- core services folder ID
- network hub project ID
- security project ID
- logging project ID
- VPC ID and name

## Outputs

The bootstrap configuration exposes the following useful values:

- `core_services_folder_id`
- `network_hub_project_id`
- `network_hub_project_number`
- `network_hub_vpc_id`
- `network_hub_vpc_name`
- `network_hub_enabled_services`
- `security_project_id`
- `security_project_number`
- `logging_project_id`
- `logging_project_number`

## Notes

- This repository is a bootstrap template and should be reviewed carefully before production deployment.
- The default folder name is set to `testing-services` and can be changed to match your organizational naming standards.
- The VPC and subnet are intentionally minimal; production environments typically need additional networking controls such as firewall rules, private service access, routing, and shared VPC configuration.
- The code currently enables only `compute.googleapis.com` for the network project as an example.

## Security Considerations

Before using this as a production landing zone:

- validate IAM roles and service accounts
- restrict who can create resources in the folder
- review billing and budget controls
- define project naming conventions for dev, test, and prod environments
- add organization policy constraints, logging, and monitoring

## License

This project does not currently include a license file. Confirm the repository governance and licensing requirements with your organization before using it outside internal development.
