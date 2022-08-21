## PRIVATE OUTPUTS
output "private_aws_route_id" {
  value = aws_route.private_nat_route.id
}

output "private_nat_gateway_id" {
  value = aws_route.private_nat_route.nat_gateway_id
}

output "private_route_table_id" {
  value = aws_route.private_nat_route.route_table_id
}


# PUBLIC OUTPUTS
output "public_aws_route_id" {
  value = aws_route.public_igw_route.id
}

output "public_gateway_id" {
  value = aws_route.public_igw_route.gateway_id
}

output "public_route_table_id" {
  value = aws_route.public_igw_route.route_table_id
}
