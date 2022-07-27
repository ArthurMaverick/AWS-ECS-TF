output "instance_role_arn" {
  value = aws_iam_role.ecs_instance_role.arn
}

output "iam_instance_profile_id" {
  value = aws_iam_instance_profile.ecs.id
}


output "alb_role_arn" {
  value = aws_iam_role.ecs_lb_role.arn
}

output "aws_iam_role_policy_attachment_id" {
  value = aws_iam_role_policy_attachment.ecs_lb.id
}
