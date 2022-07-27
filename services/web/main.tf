module "ecs_task_definition" {
  source = "../ecs_task_definition"
  service_name = var.service_name
  container_definitions = var.container_definitions
}

resource "aws_ecs_service" "cluster" {
  name            = "${var.environment}-${var.service_name}"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = module.ecs_task_definition.task_definition
  desired_count   = 1
  iam_role        = aws_iam_role.foo.arn #
  depends_on      = [aws_iam_role_policy.foo]

  load_balancer {
    ## elb reference
    elb_name         = var.elb_target_group_name
    target_group_arn = var.elb_target_group_arn
    ## container reference
    container_port   = var.container_port
    container_name   = var.container_name
  }

}