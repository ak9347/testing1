resource "aws_instance" "first-instance"{
    ami = var.ami-id #devops practice in us east1
    instance_type = var.instance-type == "MangoDb" ? "t2.micro" : "t3.micro"

}