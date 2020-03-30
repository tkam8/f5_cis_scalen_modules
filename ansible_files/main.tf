# Configure the Google Cloud provider
provider "google" {
  project     = var.project
  region      = var.region
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "gcs" {}
  
  # This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
  required_version = ">= 0.12"
}

# -------------------------
# Setup variables for the Ansible inventory
# -------------------------
resource "local_file" "ansible_inventory_file" {
  content  = templatefile("./templates/ansible_inventory.tpl", {
    gcp_F51_public_ip                = var.bigip1_public_ip
    gcp_F52_public_ip                = var.bigip2_public_ip
    gcp_F53_public_ip                = var.bigip3_public_ip
    gcp_F51_private_ip               = var.bigip1_private_ip
    gcp_F52_private_ip               = var.bigip2_private_ip
    gcp_F53_private_ip               = var.bigip3_private_ip
    gcp_gke1_cluster_name            = var.gke1_cluster_name
    gcp_gke2_cluster_name            = var.gke2_cluster_name
    gcp_gke3_cluster_name            = var.gke3_cluster_name
    gcp_gke1_endpoint                = var.gke1_endpoint
    gcp_gke2_endpoint                = var.gke2_endpoint
    gcp_gke3_endpoint                = var.gke3_endpoint
  })
  filename = "${var.terragrunt_path}/../../ansible/playbooks/inventory/hosts"
}

resource "local_file" "ansible_f5_vars_file" {
  content  = templatefile("./templates/ansible_f5_vars.tpl", {
    gcp_tag_value         = var.app_tag_value
  })
  filename = "${var.terragrunt_path}/../../ansible/playbooks/group_vars/F5_systems/vars"
}

resource "local_file" "ansible_nginx_controller_vars_file" {
  content  = templatefile("./templates/ansible_nginx_controller_vars.tpl", {})
  filename = "${var.terragrunt_path}/../../ansible/playbooks/group_vars/gcp_nginx_controller_systems/vars"
}