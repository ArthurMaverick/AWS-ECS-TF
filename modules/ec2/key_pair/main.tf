resource "aws_key_pair" "deploy_public_key" {
  key_name   = var.public_key_name
  public_key = var.public_key
  tags = {
    Environment = var.environment
  }
}