output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "default_alb_target_group" {
  value = aws_alb_target_group.default.arn
}

output "default_alb_target_group_name" {
  value = aws_alb_target_group.default.name
}

output "default_alb_target_group_port" {
  value = aws_alb_target_group.default.port
}