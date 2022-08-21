variable "vpc_cidr" {
  description = "(required) Vpc Cidr"
  default     = "${vpc_cidr}/16"
}
variable "environment" {
  description = "(required) The name of the environment"
}
