# We are creating one more subnets that we want to address as one, therefore we create a
# routing table and add all the subnets to it. This allows us to easily create routing to
# all the subnets at once. For example, when creating a route to the Internet Gateway.
resource "aws_route_table" "subnet" {
  vpc_id = var.vpc_id
  count  = length(var.cidrs)

  tags = {
    Name        = "${var.name}_${element(var.availability_zones, count.index)}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "subnet" {
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = element(aws_route_table.subnet.*.id, count.index)
  count          = length(var.cidrs)
}
