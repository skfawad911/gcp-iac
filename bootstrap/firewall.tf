resource "google_compute_firewall" "allow_aws_to_gcp" {
  name      = "allow-aws-to-gcp-vpn"
  project   = var.project_id
  network   = var.network_name
  direction = "INGRESS"
  priority  = 1000

  source_ranges = var.aws_vpc_cidrs
  target_tags   = var.gcp_firewall_target_tags

  dynamic "allow" {
    for_each = var.gcp_allowed_tcp_ports
    content {
      protocol = "tcp"
      ports    = [allow.value]
    }
  }

  dynamic "allow" {
    for_each = var.gcp_allowed_udp_ports
    content {
      protocol = "udp"
      ports    = [allow.value]
    }
  }
}

resource "google_compute_firewall" "allow_gcp_to_aws" {
  name      = "allow-gcp-to-aws-vpn"
  project   = var.project_id
  network   = var.network_name
  direction = "EGRESS"
  priority  = 1000

  destination_ranges = var.aws_vpc_cidrs
  target_tags        = var.gcp_firewall_target_tags

  dynamic "allow" {
    for_each = var.gcp_allowed_tcp_ports
    content {
      protocol = "tcp"
      ports    = [allow.value]
    }
  }

  dynamic "allow" {
    for_each = var.gcp_allowed_udp_ports
    content {
      protocol = "udp"
      ports    = [allow.value]
    }
  }
}