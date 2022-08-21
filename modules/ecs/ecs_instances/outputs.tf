output "ecs_instance_security_group_id" {
  value = aws_security_group.instance.id
}

output "ecs_instance_security_group_description" {
  value = data.aws_ami.latest_ecs_ami.description
}

output "aws_key_pair" {
  value = aws_key_pair.deployer.arn
}

output "aws_launch_configuration_arn"  {
  value = aws_launch_configuration.launch.arn
}

output "aws_autoscaling_group_arn" {
  value = aws_autoscaling_group.asg.arn
}

output "template_file_user_data" {
  value = data.template_file.user_data.filename
}