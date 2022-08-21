variable "aws_eips" {
  value = "${aws_eip.eip.*.id}"
}

variable "is_vpc" {
  type = "bool"
  default = true
}