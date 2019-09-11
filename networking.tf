resource "openstack_networking_network_v2" "network_1" {
  name           = "network_1"
  admin_state_up = "true"

}
resource "openstack_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  cidr       = "192.168.199.0/24"
  ip_version = 4
}
resource "openstack_networking_router_v2" "router_1" {
  name                = "router_1"
  external_network_id = "30a1d712-90ba-4978-b341-438e103ae48d"
}
resource "openstack_networking_router_interface_v2" "rif" {
  router_id = "${openstack_networking_router_v2.router_1.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}"

}
resource "openstack_networking_floatingip_v2" "floatie_1" {
  pool = "${var.openstack_login.external_ip_pool}"

}
resource "openstack_compute_floatingip_associate_v2" "floatinstance" {
  floating_ip = "${openstack_networking_floatingip_v2.floatie_1.address}"
  instance_id = "${openstack_compute_instance_v2.basic.id}"
}
