resource "aws_ecs_task_set" "task_set" {
  service         = var.ecs_service_id
  cluster         = var.ecs_cluster_id
  task_definition = var.ecs_task_definition_arn

  load_balancer {
    target_group_arn = var.lb_target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}