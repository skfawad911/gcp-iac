############################################################
# NETWORK CONNECTIVITY CENTER HUB
############################################################

resource "google_network_connectivity_hub" "this" {
  name            = var.hub_name
  project         = var.project_id
  description     = var.hub_description
  preset_topology = var.preset_topology
  export_psc      = var.export_psc
}


############################################################
# VPC SPOKES
############################################################

resource "google_network_connectivity_spoke" "vpc" {
  for_each = var.vpc_spokes

  name        = each.key
  project     = coalesce(each.value.project_id, var.project_id)
  location    = "global"
  hub         = google_network_connectivity_hub.this.id
  description = each.value.description

  # STAR topology needs every spoke in a "center" or "edge" group
  group = each.value.group == null ? null : "${google_network_connectivity_hub.this.id}/groups/${each.value.group}"

  linked_vpc_network {
    uri                   = each.value.network_self_link
    exclude_export_ranges = each.value.exclude_export_ranges
  }
}