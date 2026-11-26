output "gateway" {
  value = google_compute_ha_vpn_gateway.ha_gateway
}

output "external_gateway" {
  value = var.peer_external_gateway != null ? google_compute_external_vpn_gateway.external_gateway[0] : null
}

output "name" {
  value = regex("[\\w-]+$", lower(local.vpn_gateway_self_link))
}

output "router" {
  value = var.router_name == "" ? google_compute_router.router[0] : null
}

output "router_name" {
  value = local.router
}

output "self_link" {
  value = local.vpn_gateway_self_link
}

output "tunnels" {
  sensitive = true
  value = {
    for name in keys(var.tunnels) : name => google_compute_vpn_tunnel.tunnels[name]
  }
}

output "tunnel_names" {
  value = {
    for name in keys(var.tunnels) : name => google_compute_vpn_tunnel.tunnels[name].name
  }
}

output "tunnel_self_links" {
  sensitive = true
  value = {
    for name in keys(var.tunnels) : name => google_compute_vpn_tunnel.tunnels[name].self_link
  }
}

output "random_secret" {
  sensitive = true
  value     = local.secret
}