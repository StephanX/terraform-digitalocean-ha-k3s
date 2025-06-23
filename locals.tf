locals {

  project_name = var.project_name

  server_droplet_tag = digitalocean_tag.server.name

  # servers_init =  {
  #   name       = server.name
  #   ip_public  = server.ipv4_address
  #   ip_private = server.ipv4_address_private
  #   price      = server.price_monthly
  #   id         = server.id
  #   ssh_key_fingerprints = var.ssh_key_fingerprints
  # }

  # servers =     {
  #   name       = digitalocean_droplet.k3s_server.name
  #   ip_public  = digitalocean_droplet.k3s_server.ipv4_address
  #   ip_private = digitalocean_droplet.k3s_server.ipv4_address_private
  #   price      = digitalocean_droplet.k3s_server.price_monthly
  #   id         = digitalocean_droplet.k3s_server.id
  #   ssh_key_fingerprints = var.ssh_key_fingerprints
  # }

}