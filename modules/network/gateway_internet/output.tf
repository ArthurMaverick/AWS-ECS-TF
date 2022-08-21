output "igw" {
  value = aws_internet_gateway.vpc.id
}

output "id" {
  value = data.aws_vpc.selected.id
}

output "cidr_block" {
  value = data.aws_vpc.selected.cidr_block
}
