variable "peer_external_gateway" {
  description = "Configuration of an external VPN gateway to which this VPN is connected."
  type = object({
    name            = optional(string)
    redundancy_type = optional(string)
    interfaces = list(object({
      id         = number
      ip_address = string
    }))
  })
  default = null
}

variable "peer_gcp_gateway" {
  type    = string
  default = null
}

variable "name" {
  type = string
}

variable "stack_type" {
  type    = string
  default = "IPV4_ONLY"
}

variable "network" {
  type = string
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "route_priority" {
  type    = number
  default = 1000
}

variable "router_advertise_config" {
  type = object({
    groups    = list(string)
    ip_ranges = map(string)
    mode      = optional(string)
  })
  default = null
}

variable "router_asn" {
  type    = number
  default = 64514
}

variable "keepalive_interval" {
  type    = number
  default = 20
}

variable "router_name" {
  type    = string
  default = ""
}

variable "tunnels" {
  type = map(object({
    bgp_peer = object({
      address = string
      asn     = number
    })
    bgp_session_name = optional(string)
    bgp_peer_options = optional(object({
      ip_address          = optional(string)
      advertise_groups    = optional(list(string))
      advertise_ip_ranges = optional(map(string))
      advertise_mode      = optional(string)
      route_priority      = optional(number)
    }))
    bgp_session_range               = optional(string)
    ike_version                     = optional(number)
    vpn_gateway_interface           = optional(number)
    peer_external_gateway_self_link = optional(string, null)
    peer_external_gateway_interface = optional(number)
    shared_secret                   = optional(string, "")
  }))
  default = {}
}

variable "vpn_gateway_self_link" {
  type    = string
  default = null
}

variable "create_vpn_gateway" {
  type    = bool
  default = true
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "external_vpn_gateway_description" {
  type    = string
  default = "Terraform managed external VPN gateway"
}