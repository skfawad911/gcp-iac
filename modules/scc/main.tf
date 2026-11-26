resource "terraform_data" "scc_standard" {
  input = {
    organization_id = var.organization_id
    tier            = "STANDARD"
  }
}