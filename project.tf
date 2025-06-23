resource "digitalocean_project" "k3s_cluster" {
  name        = local.project_name
  description = "k3s Single Node"
  purpose     = "K3s Single Node"
  environment = "development"
}