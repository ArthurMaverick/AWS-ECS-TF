# public_igw_route
variable "public_subnet_cidrs" {
  type        = list
  description = "List of public cidrs, for every availability zone you want you need one. Example: 10.0.0.0/24 and 10.0.1.0/24"
}

variable "public_destination_cidr_block" {
  default     = "0.0.0.0/0"
  description = "Specify all traffic to be routed either trough Internet Gateway or NAT to access the internet"
}

variable "public_route_table_id" {
  description = "public_route_table_ids"
}

variable "gateway_id" {
  description = "gateway_id"
}

# private_nat_route
variable "private_subnet_cidrs" {
  type        = list
  description = "List of private cidrs, for every availability zone you want you need one. Example: 10.0.0.0/24 and 10.0.1.0/24"
}

variable "private_destination_cidr_block" {
  default     = "0.0.0.0/0"
  description = "Specify all traffic to be routed either trough Internet Gateway or NAT to access the internet"
}

variable "private_route_table_id" {
  description = "private route table ids"
}

variable "nat_gateway_id" {
  description = "nat_gateway_ids"
}
