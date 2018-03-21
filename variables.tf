variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  default     = false
}

variable "enable_http2" {
  description = "Indicates whether HTTP/2 is enabled in application load balancers."
  default     = true
}

variable "https_listeners" {
  description = "A list of maps describing the HTTPS listeners for this ALB. Required keys: port, certificate_arn. Optional keys: ssl_policy (defaults to ELBSecurityPolicy-2016-08), target_group_index (defaults to 0)"
  type        = "list"
  default     = []
}

variable "https_listeners_count" {
  description = "A manually provided count/length of the https_listeners list of maps since the list cannot be computed."
  default     = 0
}

variable "http_tcp_listeners" {
  description = "A list of maps describing the HTTPS listeners for this ALB. Required keys: port, protocol. Optional keys: target_group_index (defaults to 0)"
  type        = "list"
  default     = []
}

variable "http_tcp_listeners_count" {
  description = "A manually provided count/length of the http_tcp_listeners list of maps since the list cannot be computed."
  default     = 0
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle."
  default     = 60
}

variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack."
  default     = "ipv4"
}

variable "listener_ssl_policy_default" {
  description = "The security policy if using HTTPS externally on the load balancer. See: https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html"
  default     = "ELBSecurityPolicy-2016-08"
}

variable "load_balancer_is_internal" {
  description = "Boolean determining if the load balancer is internal or externally facing."
  default     = false
}

variable "load_balancer_create_timeout" {
  description = "Timeout value when creating the ALB."
  default     = "10m"
}

variable "load_balancer_delete_timeout" {
  description = "Timeout value when deleting the ALB."
  default     = "10m"
}

variable "load_balancer_name" {
  description = "The name prefix and name tag of the load balancer."
}

variable "load_balancer_update_timeout" {
  description = "Timeout value when updating the ALB."
  default     = "10m"
}

variable "load_balancer_security_groups" {
  description = "The security groups to attach to the load balancer. e.g. [\"sg-edcd9784\",\"sg-edcd9785\"]"
  type        = "list"
}

variable "log_bucket_name" {
  description = "S3 bucket (externally created) for storing load balancer access logs."
}

variable "log_location_prefix" {
  description = "S3 prefix within the log_bucket_name under which logs are stored."
  default     = ""
}

variable "subnets" {
  description = "A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f']"
  type        = "list"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "target_groups" {
  description = "A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required map values: name, backend_protocol, backend_port. Optional key/values found in the target_groups_defaults variable."
  type        = "list"
  default     = []
}

variable "target_groups_count" {
  description = "A manually provided count/length of the target_groups list of maps since the list cannot be computed."
  default     = 0
}

variable "target_groups_defaults" {
  description = "Default values for target groups as defined by the list of maps."
  type        = "map"

  default = {
    "cookie_duration"                  = 86400
    "deregistration_delay"             = 300
    "health_check_interval"            = 10
    "health_check_healthy_threshold"   = 3
    "health_check_path"                = "/"
    "health_check_port"                = "traffic-port"
    "health_check_timeout"             = 5
    "health_check_unhealthy_threshold" = 3
    "health_check_matcher"             = "200-299"
    "stickiness_enabled"               = true
    "target_type"                      = "instance"
  }
}

variable "vpc_id" {
  description = "VPC id where the load balancer and other resources will be deployed."
}
