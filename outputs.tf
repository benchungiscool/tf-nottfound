output "master_ip" {
  value = hcloud_server.master.ipv4_address
}

output "node_ips" {
  value = [for node in hcloud_server.nodes : [node.name, node.ipv4_address]]
}
