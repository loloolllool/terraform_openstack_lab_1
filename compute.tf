resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "cf4acd18-e218-4594-84b3-3784f4f6f12e"
  flavor_name     = "2x2x10:X"
  key_pair        = "lollen"
  security_groups = ["default", "${openstack_networking_secgroup_v2.admin.name}"]

  network {
    name = "${openstack_networking_network_v2.network_1.name}"
    port = "${openstack_networking_port_v2.instanceport.name}"

  }
}
resource "openstack_compute_interface_attach_v2" "ai_1" {
  instance_id = "${openstack_compute_instance_v2.basic.id}"
  port_id     = "${openstack_networking_port_v2.instanceport.id}"
}
