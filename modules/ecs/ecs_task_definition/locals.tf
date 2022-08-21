locals {
  container_definitions = format("[%s]",join(",",[
  for definition in var.container_definitions:
  templatefile("${path.module}/templates/container_definitions.tpl", {
    name               = definition.name,
    image              = definition.image,
    cpu                = definition.cpu,
    memory             = definition.memory,
    essential          = true,
    environment        = jsonencode([
      for key, value in definition.environment:
      {
        name  = key,
        value = value,
      }
    ]),
    secrets            = jsonencode([
      for key, value in definition.environment:
      {
        name  = key,
        valueFrom = value,
      }
    ]),
    port_mappings      = jsonencode([
      {
        containerPort = definition.container_port,
      }
    ]),
    log_configuration =  jsonencode({
      log_driver      = "awslogs"
      options         = {
        awslogs-stream-prefix = definition.name
        awslogs-group         = var.log_group_name
        awslogs-region        = var.region
        awslogs-create-group  = aws_cloudwath_log_group.log_group.name
      }
    }),
    command = definition.command,
  })
  ]))
  first_container = var.container_definitions[0]
  main_container_name = local.first_container.name
  main_container_port = local.first_container.container_port
}