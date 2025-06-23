resource "digitalocean_droplet" "k3s_server" {
  name  = "k3s-server-${var.region}"

  image      = "ubuntu-20-04-x64"
  tags       = [digitalocean_tag.server.id]
  region     = var.region
  size       = var.server_size
  monitoring = true
  vpc_uuid   = digitalocean_vpc.k3s_vpc.id
  ssh_keys   = [var.ssh_key]
  user_data = templatefile("${path.module}/user_data/ks3_server.sh", {
    k3s_channel     = var.k3s_channel
    k3s_token       = random_password.k3s_token.result
    tls_san         = var.tls_san
  })

}

resource "digitalocean_project_resources" "k3s_server_nodes" {
  project = digitalocean_project.k3s_cluster.id
  resources = [
    digitalocean_droplet.k3s_server.urn,
  ]
}

output "host_ip" {
  description = "IP address of the server"
  value       = digitalocean_droplet.k3s_server.ipv4_address
}