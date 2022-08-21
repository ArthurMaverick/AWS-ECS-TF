resource "aws_internet_gateway" "vpc" {
  vpc_id = var.vpc_id

  tags = {
    Environment = var.environment
  }
}