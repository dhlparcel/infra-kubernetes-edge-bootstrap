variable "kubeconfig" {
  type    = string
  default = "/dev/null"
}

variable "common_name" {
  type    = string
  default = "example.local"
}

variable "dns_names" {
  type    = list(string)
  default = ["example.local"]
}
