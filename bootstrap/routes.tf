resource "google_compute_route" "aws_vpc" {
  for_each = toset(var.aws_vpc_cidrs)

  name = "route-to-aws-${replace(replace(each.value, "/", "-"), ".", "-")}"
  project    = var.project_id
  network    = var.network_name
  dest_range = each.value
  priority   = 1000

  next_hop_vpn_tunnel = module.vpn_ha.tunnel_self_links["tunnel-0"]
}