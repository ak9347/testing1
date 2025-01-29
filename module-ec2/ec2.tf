# resource "aws_instance" "ec2" {
#     ami = var.ami-id
#     instance_type = var.instance-type
  
# }

module "ec2" {
    source = "../vpc-module"
    cidr_block = var.cidr_block
    vpc_tag = var.vpc_tag
    internet_gateway_tags= var.internet_gateway_tags
    availability_zone = var.availability_zone
    common_tags = var.common_tags
    public_subnet_name = var.public_subnet_name
    public_cidr_block = var.public_cidr_block
    private_subnet_name = var.private_subnet_name
    private_cidr_block = var.private_cidr_block
    database_subnet_name = var.database_subnet_name
    database_cidr_block = var.database_cidr_block
    public_route_tag = var.public_route_tag
    private_route_tag = var.private_route_tag
    database_route_tag = var.database_route_tag
} 