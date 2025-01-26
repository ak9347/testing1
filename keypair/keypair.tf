resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/Devops.pub")
}

resource "aws_instance" "first-instance"{
    ami = "ami-0b4f379183e5706b9" #devops practice in us east1
    instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.allow_all.name]

 tags = {
  Name = "First"
 }
}