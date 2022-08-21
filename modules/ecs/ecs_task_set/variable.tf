variable "ecs_service_id" {
  type = string
}

variable "ecs_cluster_id" {
  type = string
}

variable "ecs_task_definition_arn" {
  type = string
}

variable "lb_target_group_arn" {
  type = string
}

variable "container_name" {
  type = string
}

variable "container_port" {
  type = number
}