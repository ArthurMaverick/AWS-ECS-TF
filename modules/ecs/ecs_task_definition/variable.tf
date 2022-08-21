variable "service_name" {
  type = string
}

variable "container_definitions" {
  type = list(object({
      name           = string
      image          = string
      cpu            = number
      memory         = number
      environment    = map(string)
      secrets        = map(string)
      container_port = number
      command        = list(string)
    }
  ))
  description = "Container definitions for the task definition"
}