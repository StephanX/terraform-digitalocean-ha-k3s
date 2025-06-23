# Server tag
resource "digitalocean_tag" "server" {
  name = var.server_tag
}
