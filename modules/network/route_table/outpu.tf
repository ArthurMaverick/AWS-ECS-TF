
output "route_table_ids" {
  value = "${aws_route_table.subnet.*.id}"
}

output "route_table_arn" {
  value = aws_route_table.subnet.arn
}