resource "aws_security_group_rule" "alb_to_ecs" {
  type                     = "ingress"
  from_port                = 32768
  to_port                  = 61000
  protocol                 = "TCP"
  source_security_group_id = var.alb_security_group_id
  security_group_id        = var.ecs_instance_security_group_id
}
