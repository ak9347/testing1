variable "cidr_block" {
    
}

variable "vpc_tag" {
  type = map 
  default = {}
}

variable "internet_gateway_tags" {
  type = map 
  default = {}
}

variable "public_cidr_block" {
  
}

variable "availability_zone" {
  
}

variable "common_tags" {
  type = map
  default = {}
}

variable "public_subnet_name" {
  
}

variable "private_cidr_block" {
  
}

variable "private_subnet_name" {
  
}

variable "database_cidr_block" {
  
}

variable "database_subnet_name" {
  
}

variable "public_route_tag" {
  
}

variable "private_route_tag" {
  
}

variable "database_route_tag" {
  
}