data "aws_vpc" "selected" {
  id = var.vpc_id
}

locals{
  environment = terraform.workspace
}

module "vpc" {
  source = "../../modules/vpc"
  environment = local.environment
  vpc_id = var.vpc_id
}

module "network" {
  source               = "../../modules/network"
  environment          = local.environment
  vpc_id               = module.vpc.id
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  depends_id           = ""

  depends_on = [
    module.vpc.id
  ]
}

module "alb" {
  source = "../../modules/alb"
  environment       = local.environment
  alb_name          = "${local.environment}-${var.cluster}"
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
}


module "roles" {
  source = "../../modules/roles"
  environment = local.environment
}

module "ecs" {
  source = "../../modules/ecs"
  environment           = local.environment
  cluster               = local.environment
  cloudwatch_prefix     = local.environment           #See ecs_instances module when to set this and when not!

  vpc_id                = module.vpc.id
  # vpc_cidr              = var.vpc_cidr
  # public_subnet_cidrs   = var.public_subnet_cidrs
  # private_subnet_cidrs  = var.private_subnet_cidrs
  depends_id            = module.network.depends_id

  source_security_group_id = module.alb.alb_security_group_id

  max_size              = var.max_size
  min_size              = var.min_size
  desired_capacity      = var.desired_capacity
  public_key            = var.public_key
  instance_type         = var.instance_type

  ecs_aws_ami           = var.aws_ecs_ami

  private_subnet_ids    = module.network.private_subnet_ids
  iam_instance_profile_id = module.roles.iam_instance_profile_id

  depends_on = [
    module.network.depends_id
  ]
}
