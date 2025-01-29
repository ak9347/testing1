# variable "instance-type" {
#     type = string
# }

# variable "ami-id" {
#     type = string
# }

variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "vpc_tag" {
    default = {
        Name = "roboshop"
        Environment = "Dev"
        Terraform = "True"
    }
    
}

variable "internet_gateway_tags" {
    default = {
        Name = "roboshop"
        Environment = "Dev"
        Terraform = "True"
    } 
}

variable "public_cidr_block" {
    default = ["10.0.1.0/24", "10.0.2.0/24"] 
}

variable "availability_zone" {
    default = ["us-east-1a", "us-east-1b"] 
}

variable "common_tags" {
    default = {
        Project = "Infra"
        Environment = "Dev"
        Terraform = "true"
    }  
}

variable "public_subnet_name"{
    type = list
    default = ["subnet1a","subnet1c"]
}

variable "private_cidr_block" {
    default = ["10.0.11.0/24", "10.0.12.0/24"] 
}

variable "private_subnet_name" {
    default = ["subnet2a", "subnet2b"] 
}

variable "database_cidr_block" {
    default = ["10.0.21.0/24", "10.0.22.0/24"] 
}

variable "database_subnet_name" {
    default = ["subnet3a", "subnet3b"] 
}

variable "public_route_tag" {
    type = map
    default = {
        Name = "roboshop"
    }
  
}

variable "private_route_tag" {
    type = map
    default = {
        Name = "roboshop"
    }
}

variable "database_route_tag" {
    type = map
    default = {
        Name = "roboshop"
    }
}