data "google_project" "psc_hub" {
  project_id = var.psc_hub_project_id
}
 
resource "google_project_iam_member" "psc_hub_dns_peer" {
  project = data.google_project.psc_hub.project_id
  role    = "roles/dns.peer"
  member  = "user:${var.user_id}"
}

resource "google_project_iam_member" "dns_admin" {
  for_each = toset(var.dns_admin_project_ids)

  project = each.value
  role    = "roles/dns.admin"
  member  = "user:${var.user_id}"
}


