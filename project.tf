resource "digitalocean_project" "k3s_cluster" {
  name        = local.project_name
  description = "k3s Cluster"
  purpose     = "HA K3s (Kubernetes) Cluster"
  environment = "Development"
}