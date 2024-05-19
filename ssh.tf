
# Create a new SSH key
resource "hcloud_ssh_key" "this" {
  name       = "Server SSH Key"
  public_key = var.ssh_key
}
