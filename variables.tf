
variable "openstack_login" {
  default = {
    user_name   = ""
    tenant_name = ""
    password    = ""
    auth_url    = ""
    external_ip_pool = ""
  }
}