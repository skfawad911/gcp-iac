resource "random_id" "project_suffix" {
  byte_length = 4
}

resource "google_project" "this" {
  name = var.project_name

  project_id = "${var.project_prefix}-${random_id.project_suffix.hex}"

  folder_id = var.folder_id
  billing_account = var.billing_account_id
  deletion_policy = "DELETE"

}