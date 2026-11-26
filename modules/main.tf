resource "google_folder" "this" {
  display_name = var.folder_name
  parent       = var.parent
  deletion_protection=false
}
