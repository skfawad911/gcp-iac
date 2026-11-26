data "google_project" "existing" {
  project_id = var.project_id
}
 
resource "google_project" "managed" {
  name            = data.google_project.existing.name
  project_id      = var.project_id
  folder_id       = var.folder_id
  deletion_policy = "PREVENT"
}