locals {
  extra_ssl_certs = ["${var.extra_ssl_certs}"]
  target_groups = ["${var.target_groups}"]
  http_tcp_listeners = ["${var.http_tcp_listeners}"]
  https_listeners = ["${var.https_listeners}"]
}
