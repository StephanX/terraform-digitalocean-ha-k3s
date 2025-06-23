variable "do_token" {
  type        = string
  description = "DigitalOcean Personal Access Token"
}

variable "ssh_key" {
  type        = string
  description = "SSH Key fingerprint"
}

variable "tls_san" {
  type        = string
  description = "k3s tls-san"
}

variable "region" {
  type        = string
  description = "Region in which to deploy the cluster. Default is fra1 (Frankfurt, Germany)"
  default     = "fra1"
  validation {
    condition     = length(regexall("^nyc1|sfo1|nyc2|ams2|sgp1|lon1|nyc3|ams3|fra1|tor1|sfo2|blr1|sfo3$", var.region)) > 0
    error_message = "Invalid region. Valid regions are nyc1, sfo1, nyc2, ams2, sgp1, lon1, nyc3, ams3, fra1, tor1, sfo2, blr1 or sfo3."
  }
}

variable "project_name" {
  type        = string
  description = "project name"
  default     = "k3s-cluster"
}

variable "vpc_network_range" {
  type        = string
  description = "Range of IP addresses for the VPC in CIDR notation. Cannot be larger than /16 or smaller than /24. Default is 10.10.10.0/24"
  default     = "10.10.10.0/24"
}

variable "k3s_channel" {
  type        = string
  description = "K3s release channel. 'stable', 'latest', 'testing' or a specific channel or version e.g. 'v1.20', 'v1.21.0+k3s1'"
  default     = "stable"
}

variable "server_size" {
  type        = string
  description = "Server droplet size. e.g. s-1vcpu-2gb"
  default     = "s-1vcpu-2gb"
}

variable "server_image" {
  type        = string
  description = "Server Image to use e.g. ubuntu-24-10-x64"
  default     = "ubuntu-24-10-x64"
}


variable "sys_upgrade_ctrl" {
  type        = bool
  description = "Pre-install the System Upgrade Controller?"
  default     = false
}

variable "server_tag" {
  type        = string
  description = "Server resource tag name."
  default     = "k3s_server"
}