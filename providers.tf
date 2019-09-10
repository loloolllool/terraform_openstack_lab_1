

provider "openstack" {
  user_name   = "${var.openstack_login.user_name}"
  tenant_name = "${var.openstack_login.tenant_name}"
  password    = "${var.openstack_login.password}"
  auth_url    = "${var.openstack_login.auth_url}"
  region      = "RegionOne"
}
