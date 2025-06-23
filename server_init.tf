# resource "digitalocean_droplet" "k3s_server_init" {
#   count = 1
#   name  = "k3s-server-${var.region}"

#   image      = var.server_image
#   tags       = [digitalocean_tag.server.id]
#   region     = var.region
#   size       = var.server_size
#   monitoring = true
#   vpc_uuid   = digitalocean_vpc.k3s_vpc.id
#   ssh_keys   = [var.ssh_key]
#   user_data = templatefile("${path.module}/user_data/ks3_server_init.sh", {
#     k3s_channel           = var.k3s_channel
#     k3s_token             = random_password.k3s_token.result
#     do_token              = var.do_token
#     do_cluster_vpc_id     = digitalocean_vpc.k3s_vpc.id
#     tls_san = var.tls_san
#     ccm_manifest          = base64gzip(file("${path.module}/manifests/do-ccm.yaml"))
#     csi_crds_manifest     = base64gzip(file("${path.module}/manifests/do-csi/crds.yaml"))
#     csi_driver_manifest   = base64gzip(file("${path.module}/manifests/do-csi/driver.yaml"))
#     csi_sc_manifest       = base64gzip(file("${path.module}/manifests/do-csi/snapshot-controller.yaml"))
#     sys_upgrade_ctrl = var.sys_upgrade_ctrl == true ? base64gzip(file("${path.module}/manifests/system-upgrade-controller.yaml")) : ""
#   })
# }

# resource "digitalocean_project_resources" "k3s_init_server_node" {

#   project = digitalocean_project.k3s_cluster.id
#   resources = [
#     digitalocean_droplet.k3s_server.urn
#   ]
# }