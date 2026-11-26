resource "google_dns_managed_zone" "googleapis" {

  project     = var.dns_project_id
  name        = var.dns_zone_name
  dns_name    = var.dns_domain
  description = "Private DNS zone for PSC"

  visibility = "private"

  private_visibility_config {
    dynamic "networks" {
      for_each = var.network_self_links

      content {
        network_url = networks.value
      }
    }
  }
}

resource "google_dns_record_set" "psc" {
  name         = var.dns_domain
  managed_zone = google_dns_managed_zone.googleapis.name
  type         = "A"
  ttl          = var.dns_record_ttl
  project     = var.dns_project_id

  rrdatas = [var.psc_endpoint_ip]
}