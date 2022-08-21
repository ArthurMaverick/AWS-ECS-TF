output "default_alb_target_group_id" {
  value = aws_ecs_cluster.cluster.id
}

output "default_alb_target_group_name" {
  value = aws_ecs_cluster.cluster.name
}

output "default_alb_target_group_setting" {
  value = aws_ecs_cluster.cluster.setting
}

output "default_alb_target_group_tags_all" {
  value = aws_ecs_cluster.cluster.tags_all
}

output "default_alb_target_group_capacity_providers" {
  value = aws_ecs_cluster.cluster.capacity_providers
}

output "ecs_instance_security_group_id" {
  value = module.ecs_instances.ecs_instance_security_group_id
}