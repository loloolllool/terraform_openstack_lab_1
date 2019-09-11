resource "openstack_networking_secgroup_v2" "admin" {
  name        = "admin ssh"
  description = "Give SSH access to my machine"

}
resource "openstack_networking_secgroup_rule_v2" "ssh" {
  security_group_id = "${openstack_networking_secgroup_v2.admin.id}"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
}

# resource "openstack_networking_port_v2" "instanceport" {
#   network_id = "${openstack_networking_network_v2.network_1.id}"
#   port_security_enabled = true
#   name = "port_01"
# }
# resource "openstack_networking_port_secgroup_associate_v2" "sshport" {
#   port_id = "${openstack_networking_port_v2.instanceport.id}"
#   security_group_ids = [
#     "${openstack_networking_secgroup_v2.admin.id}",
#   ]
# }
