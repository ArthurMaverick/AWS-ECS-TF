resource "aws_ecs_cluster" "cluster" {
  name = var.cluster

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

}

module "ecs_instances" {
  source = "../ecs_instances"

  environment             = var.environment
  cluster                 = var.cluster
  cloudwatch_prefix       = var.cloudwatch_prefix
  
  vpc_id                  = var.vpc_id
  # vpc_cidr                = var.vpc_cidr
  depends_id              = var.depends_id
  instance_group          = var.instance_group
  aws_ami                 = var.ecs_aws_ami
  instance_type           = var.instance_type
  max_size                = var.max_size
  min_size                = var.min_size
  desired_capacity        = var.desired_capacity
  iam_instance_profile_id = var.iam_instance_profile_id
  public_key              = var.public_key
  load_balancers          = var.load_balancers
  custom_userdata         = var.custom_userdata

  private_subnet_ids      = var.private_subnet_ids
}