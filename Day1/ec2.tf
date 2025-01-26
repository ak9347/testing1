resource "aws_instance" "first-instance"{
    ami = var.ami-id #devops practice in us east1
    instance_type = var.instance-type
    security_groups = [aws_security_group.allow-all.name]  #need to use the terraform security group name
    tags = var.tags-of-instance
}