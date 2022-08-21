# Using the AWS NAT Gateway service instead of a nat instance, it's more expensive but easier
# See comparison http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-nat-comparison.html

resource "aws_nat_gateway" "nat" {
  count         = var.subnet_count
  allocation_id = element(var.allocation_id, count.index)
  subnet_id     = element(var.subnet_ids, count.index)
}

# resource "aws_eip" "nat" {
#   vpc   = true
#   count = var.subnet_count
# }
