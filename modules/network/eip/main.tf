resource "aws_eip" "eip" {
  count = var.number_of_eips
  vpc   = var.is_vpc
}
