resource "aws_ecs_task_definition" "service" {
  family                   = var.task_family
  network_mode             = var.network_mode
  requires_compatibilities = ["EC2"]
  execution_role_arn       = var.task_role.arn
  container_definitions    = local.container_definitions

}