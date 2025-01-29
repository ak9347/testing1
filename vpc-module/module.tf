resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = var.vpc_tag
}

resource "aws_internet_gateway" "main"{
    vpc_id = aws_vpc.main.id
    tags = var.internet_gateway_tags
}

resource "aws_subnet" "public" {
    count = length(var.public_cidr_block)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.public_cidr_block[count.index]
    availability_zone = var.availability_zone[count.index]

    tags = merge(
    var.common_tags, 
    {
        Name = var.public_subnet_name[count.index]
    }
    )
    }

resource "aws_subnet" "private" {
    count = length(var.private_cidr_block)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.private_cidr_block[count.index]
    availability_zone = var.availability_zone[count.index]

    tags = merge(
    var.common_tags, 
    {
        Name = var.private_subnet_name[count.index]
    }
    )
    }

resource "aws_subnet" "database" {
    count = length(var.database_cidr_block)
    vpc_id     = aws_vpc.main.id
    cidr_block = var.database_cidr_block[count.index]
    availability_zone = var.availability_zone[count.index]

    tags = merge(
    var.common_tags, 
    {
        Name = var.database_subnet_name[count.index]
    }
    )
    }

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    var.common_tags,
    var.public_route_tag
  )
}

resource "aws_route_table_association" "public"{
    count = length(var.public_cidr_block)
    subnet_id = element(aws_subnet.public[*].id, count.index)  #element retrives the single element form the list
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
     vpc_id = aws_vpc.main.id
     tags = merge(
     var.common_tags,
     var.private_route_tag
    )
}

resource "aws_route_table_association" "private"{
    count = length(var.private_cidr_block)
    subnet_id = element(aws_subnet.private[*].id, count.index)  #element retrives the single element form the list
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table" "database" {
     vpc_id = aws_vpc.main.id
     tags = merge(
     var.common_tags,
     var.database_route_tag
    )
}

resource "aws_route_table_association" "database"{
    count = length(var.database_cidr_block)
    subnet_id = element(aws_subnet.database[*].id, count.index)  #element retrives the single element form the list
    route_table_id = aws_route_table.database.id
}