/*
k8s master node
*/
resource "hcloud_server" "master" {
  name                     = "${var.cluster_name}-${var.resource_category}-master"
  server_type              = var.node_size_override == "UNSET" ? local.default_master : var.master_size_override
  shutdown_before_deletion = true

  ssh_keys = var.ssh_keys

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }
}

resource "hcloud_server" "nodes" {
  count = var.node_count

  name                     = "${var.cluster_name}-${var.resource_category}-node-${count.index}"
  server_type              = var.node_size_override == "UNSET" ? local.default_node : var.node_size_override
  shutdown_before_deletion = true

  ssh_keys = var.ssh_keys

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

}
