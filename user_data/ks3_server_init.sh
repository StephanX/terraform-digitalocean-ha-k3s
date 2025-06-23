# #!/bin/bash

# apt-get -yq update
# apt-get install -yq \
#     ca-certificates \
#     curl \
#     ntp \
#     wireguard

# # Store Droplet ID in variable (utilises DO's Metadata Service - https://developers.digitalocean.com/documentation/metadata/)
# DROPLET_ID=$(curl -s http://169.254.169.254/metadata/v1/id)

# # k3s
# curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=${k3s_channel} K3S_TOKEN=${k3s_token} sh -s - \
#     --kubelet-arg "provider-id=digitalocean://$DROPLET_ID" \
#     --tls-san ${tls_san} \
#     --flannel-backend=vxlan \
#     --flannel-iface=eth1 \
#     --disable local-storage \
#     --disable-cloud-controller \
#     --kubelet-arg 'cloud-provider=external'
#     # --disable servicelb \

# # additional manifests
# while ! test -d /var/lib/rancher/k3s/server/manifests; do
#     echo "Waiting for '/var/lib/rancher/k3s/server/manifests'"
#     sleep 1
# done

# # create digitalOcean API access token secret
# kubectl -n kube-system create secret generic digitalocean --from-literal=access-token=${do_token}

# # ccm
# base64 -d <<'EOF' | zcat | sudo tee /var/lib/rancher/k3s/server/manifests/do-ccm.yaml
# ${ccm_manifest}
# EOF

# # csi crds
# base64 -d <<'EOF' | zcat | sudo tee /var/lib/rancher/k3s/server/manifests/crds.yaml
# ${csi_crds_manifest}
# EOF

# # csi driver
# base64 -d <<'EOF' | zcat | sudo tee /var/lib/rancher/k3s/server/manifests/driver.yaml
# ${csi_driver_manifest}
# EOF

# # csi snapshot controller
# base64 -d <<'EOF' | zcat | sudo tee /var/lib/rancher/k3s/server/manifests/snapshot-controller.yaml
# ${csi_sc_manifest}
# EOF

# # csi snapshot validation webhook
# base64 -d <<'EOF' | zcat | sudo tee /var/lib/rancher/k3s/server/manifests/snapshot-validation-webhook.yaml
# ${csi_sc_manifest}
# EOF
