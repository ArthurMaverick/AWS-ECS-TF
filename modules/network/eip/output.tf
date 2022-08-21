output "aws_eips" {
  value = "${aws_eip.eip.*.id}"
}