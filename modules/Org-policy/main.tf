############################################################
# 1. Restrict resources to India
############################################################

resource "google_org_policy_policy" "resource_locations" {
  name   = "organizations/${var.organization_id}/policies/gcp.resourceLocations"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      values {
        allowed_values = var.allowed_locations
      }
    }
  }
}


############################################################
# 2. Prevent public access to Cloud Storage buckets
############################################################

resource "google_org_policy_policy" "storage_public_access_prevention" {
  name   = "organizations/${var.organization_id}/policies/storage.publicAccessPrevention"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}


############################################################
# 3. Require CMEK for selected services
############################################################

resource "google_org_policy_policy" "restrict_non_cmek_services" {
  name   = "organizations/${var.organization_id}/policies/gcp.restrictNonCmekServices"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      values {
        denied_values = var.cmek_services
      }
    }
  }
}


############################################################
# 4. Disable Service Account Key Creation
############################################################
/*
resource "google_org_policy_policy" "disable_service_account_key_creation" {
  name   = "organizations/${var.organization_id}/policies/iam.disableServiceAccountKeyCreation"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}
*/

############################################################
# 5. Disable Service Account Key Upload
############################################################
/*
resource "google_org_policy_policy" "disable_service_account_key_upload" {
  name   = "organizations/${var.organization_id}/policies/iam.disableServiceAccountKeyUpload"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = "TRUE"
    }
  }
}
*/

############################################################
# 6. Organization-level KMS Access Deny
#
# Prevent human users from performing KMS cryptographic
# operations.
#
# Service Accounts and Service Agents are excluded so
# workloads can continue using CMEK.
############################################################

resource "google_iam_deny_policy" "deny_user_kms_access" {
  parent = urlencode(
    "cloudresourcemanager.googleapis.com/organizations/${var.organization_id}"
  )

  name         = "deny-user-kms-access"
  display_name = "Deny User Access To KMS"

  rules {
    description = "Prevent human users from accessing Cloud KMS cryptographic operations"

    deny_rule {
      denied_principals = [
        "principalSet://goog/public:all"
      ]

      exception_principals = concat(
        var.iam_admin_principals,
        [
          "principalSet://cloudresourcemanager.googleapis.com/organizations/${var.organization_id}/type/ServiceAccount",
          "principalSet://cloudresourcemanager.googleapis.com/organizations/${var.organization_id}/type/ServiceAgent"
        ]
      )

      denied_permissions = [
         "cloudkms.googleapis.com/cryptoKeyVersions.destroy",
         "cloudkms.googleapis.com/cryptoKeyVersions.delete",
         "cloudkms.googleapis.com/cryptoKeys.delete"
      ]
    }
  }
}


############################################################
# 7. Organization-level IAM Administration Deny
#
# Prevent unauthorized users from modifying IAM policies
# and creating/modifying custom IAM roles.
############################################################

resource "google_iam_deny_policy" "deny_iam_administration" {
  parent = urlencode(
    "cloudresourcemanager.googleapis.com/organizations/${var.organization_id}"
  )

  name         = "deny-unauthorized-iam-administration"
  display_name = "Deny Unauthorized IAM Administration"

  rules {
    description = "Prevent unauthorized users from administering IAM"

    deny_rule {
      denied_principals = [
        "principalSet://goog/public:all"
      ]

      exception_principals = var.iam_admin_principals

      denied_permissions = [
        "cloudresourcemanager.googleapis.com/organizations.setIamPolicy",
        "cloudresourcemanager.googleapis.com/folders.setIamPolicy",
        "cloudresourcemanager.googleapis.com/projects.setIamPolicy",
        "iam.googleapis.com/roles.create",
        "iam.googleapis.com/roles.update",
        "iam.googleapis.com/roles.delete",
        "iam.googleapis.com/serviceAccounts.setIamPolicy"
      ]
    }
  }
}