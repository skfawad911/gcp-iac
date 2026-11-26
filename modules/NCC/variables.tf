variable "project_id" {
  description = "Project that hosts the NCC hub"
  type        = string
}

variable "hub_name" {
  description = "NCC hub name"
  type        = string
}

variable "hub_description" {
  description = "NCC hub description"
  type        = string
  default     = null
}

variable "preset_topology" {
  description = "Hub topology: MESH (all spokes talk to each other) or STAR (edge spokes only talk to center spokes)"
  type        = string
  default     = "MESH"

  validation {
    condition     = contains(["MESH", "STAR"], var.preset_topology)
    error_message = "preset_topology must be MESH or STAR."
  }
}

variable "export_psc" {
  description = "Propagate Private Service Connect endpoints across spokes"
  type        = bool
  default     = true
}

variable "vpc_spokes" {
  description = "VPC spokes to attach to the hub, keyed by spoke name"
  type = map(object({
    network_self_link     = string
    project_id            = optional(string)
    description           = optional(string)
    group                 = optional(string)
    exclude_export_ranges = optional(list(string), [])
  }))
  default = {}

  validation {
    condition = alltrue([
      for s in values(var.vpc_spokes) : s.group == null || contains(["center", "edge"], s.group)
    ])
    error_message = "Spoke group must be \"center\" or \"edge\" (only used with STAR topology)."
  }
}