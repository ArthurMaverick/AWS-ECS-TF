module "vpc" {
  source = "../vpc"
  environment = var.environment
  vpc_id = var.vpc_id
}

#===================================
#       ELASTIC IP ADDRESSES
#===================================
module "eip" {
  source = "../../modules/eip"
  number_of_eips = length(var.public_subnet_cidrs)
  vpc            = true
}

#===================================
#            NAT GATEWAY
#===================================
module "nat" {
  source = "../../modules/nat_gateway"
  subnet_count = length(var.public_subnet_cidrs)
  allocation_id = module.eip.aws_eips
  subnet_ids   = module.private_subnet.subnet_ids
}

#===================================
#         INTERNET GATEWAY
#===================================



#===================================
#     PRIVATE AND PUBLICS SUBNETS
#===================================
module "private_subnet" {
  source = "../subnet"

  name               = "${var.environment}_private_subnet"
  environment        = var.environment
  vpc_id             = var.vpc_id
  cidrs              = var.private_subnet_cidrs
  availability_zones = var.availability_zones
}

module "public_subnet" {
  source = "../subnet"

  name               = "${var.environment}_public_subnet"
  environment        = var.environment
  vpc_id             = var.vpc_id
  cidrs              = var.public_subnet_cidrs
  availability_zones = var.availability_zones
}

#====================================
#  PRIVATE AND PUBLICS ROUTE TABLES
#====================================
module "private_route_table" {
  source = "../../modules/route_table"
  cidrs               = var.cidrs
  name                = var.name
  environment         = var.environment 
  availability_zones  = var.availability_zones
  subnet_ids          = module.private_subnet.subnet_ids

  depends_on = [
    module.private_subnet.subnet_ids
  ]
}

module "public_route_table" {
  source = "../../modules/route_table"
  cidrs               = var.cidrs
  name                = var.name
  environment         = var.environment 
  availability_zones  = var.availability_zones
  subnet_ids          = module.public_subnet.subnet_ids

  depends_on = [
    module.public_subnet.subnet_ids
  ]
}

#====================================
#  PRIVATE AND PUBLICS ROUTES
#====================================
module "route" {
  source = "../../modules/routes"

  # public_igw_route
  public_subnet_cidrs           = var.public_subnet_cidrs
  public_destination_cidr_block = var.destination_cidr_block
  public_route_table_id         = module.public_subnet.route_table_ids
  gateway_id                    = module.vpc.igw

  #private_nat_route
  private_subnet_cidrs           = var.private_subnet_cidrs
  private_destination_cidr_block = var.destination_cidr_block
  private_route_table_id         = module.private_subnet.route_table_ids
  nat_gateway_id                 = module.nat.ids
}


resource "aws_route_table" "subnet" {
  count  = length(var.cidrs)
  vpc_id = var.vpc_id

  tags = {
    Name        = "${var.name}_${element(var.availability_zones, count.index)}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "subnet" {
  count          = length(var.cidrs)
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = element(aws_route_table.subnet.*.id, count.index)
}


# resource "aws_route" "public_igw_route" {
#     count                  = length(var.public_subnet_cidrs)
#     route_table_id         = element(module.public_subnet.route_table_ids, count.index)
#     gateway_id             = module.vpc.igw
#     destination_cidr_block = var.destination_cidr_block
#   }

# resource "aws_route" "private_nat_route" {
#     count                  = length(var.private_subnet_cidrs)
#     route_table_id         = element(module.private_subnet.route_table_ids, count.index)
#     nat_gateway_id         = element(module.nat.ids, count.index)
#     destination_cidr_block = var.destination_cidr_block
#   }


# Creating a NAT Gateway takes some time. Some services need the internet (NAT Gateway) before proceeding. 
# Therefore we need a way to depend on the NAT Gateway in Terraform and wait until is finished. 
# Currently Terraform does not allow module dependency to wait on.
# Therefore we use a workaround described here: https://github.com/hashicorp/terraform/issues/1178#issuecomment-207369534

resource "null_resource" "dummy_dependency" {
  depends_on = [module.nat]
}
