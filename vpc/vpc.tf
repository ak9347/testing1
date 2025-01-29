resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public"
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "gateway"
  }
}

resource "aws_route_table" "private-route" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "private-route"
  }
}

resource "aws_route_table" "public-route" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "public-route"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.private-route.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.public-route.id
}

resource "aws_security_group" "allow-all" {     #here the security name is used in the terraform
  name        = "Allow"  #name of the security group name in the AWS
  description = "Allow all the traffic" 
  vpc_id = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.ingress
    content{
        from_port   = ingress.value["from_port"]    #the requets form this ports is allowed 0 menas the rquest form all the port are allowed
        to_port     = ingress.value["to_port"] 
        protocol    = ingress.value["protocol"] 
        cidr_blocks = ingress.value["cidr_blocks"]  
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }
}

resource "aws_instance" "first-instance" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnet2.id
    vpc_security_group_ids = [aws_security_group.allow-all.id]
    associate_public_ip_address = true
  
}