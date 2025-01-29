# module "ec2" {
#     source = "../module-ec2"
#     ami-id = "ami-0b4f379183e5706b9"
#     instance-type = "t2.micro"
# }  # we need to define the ami id and instance type 

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = var.vpc_tag
}

resource "aws_internet_gateway" "main"{
    vpc_id = aws_vpc.main.id
    tags = var.internet_gateway_tag
}

# resource "aws_subnet" "private"{
#     count = length(var.cidr_block)
#     vpc_id = aws_vpc.main.id
#     cidr_block = var.private_subnet_cidr[count.index]
#     availability_zone = var.zone[count.index]
#     tags = merge (
#        var.common_tags,
#        {
#         Name = var.private_subnet_names[count.index] 
#        }
#     )
# }


resource "aws_subnet" "public"{
    count = length(var.cidr_block)
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = var.zone[count.index]
    tags = merge (
       var.common_tags,
       {
        Name = var.public_subnet_names[count.index] 
       }
    )
}