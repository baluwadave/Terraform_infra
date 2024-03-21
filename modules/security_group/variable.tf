variable "ports" {
  type    = list(number)
  default = [80, 443, 22,3000,9090,9100,8080]  # Example list of ports
}

variable "vpc_id" {}