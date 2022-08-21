variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "(optional) set to override the default instance type"
}

variable "network_interface_id" {
  type = string
  description = "(required) set to override the default network interface id"
}

variable "key_name" {
  type = string
  description = "(required) set key name"
}

variable "subnet_id" {
  type = string
  description = "(required) set subnet id"
}

variable "ebs_block_device" {
  type = object({
    device_name = string
    volume_size = number
  })
  description = "(required) set ebs block device"
}

variable "environment" {
  type = "string"
  description = "(required) The name of the environment"
}