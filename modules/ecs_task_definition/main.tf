
resource "aws_ecs_task_definition" "service" {
  family                = var.service_name
  container_definitions = file("${var.container_definitions}")
  network_mode          = "bridge"
}