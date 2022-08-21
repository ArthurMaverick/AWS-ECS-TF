variable "environment" {
  description = "(required) The name of the environment"
}

variable "filename" {
  description = "(required) The name of the file to be uploaded"
}

variable "iam_for_lambda_arn" {
  description = "(required) The IAM role to be used for the Lambda function"
}

variable "runtime" {
  type        = string
  description = "(optional) describe function runtime"
  default     = "nodejs16.x"
}

variable "memory_size" {
  type        = string
  description = "(optional) describe function memory size" 
  default     = "512"
}

variable "timeout" {
  type        = string
  description = "(optional) describe function timeout"
  default     = "20"
}

variable "handler" {
  type        = string
  description = "(optional) describe function handler"
  default     = "main.handler"
}