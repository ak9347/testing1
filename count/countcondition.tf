resource "aws_instance" "loop-condition" {
  count=5
  ami           = var.ami-id
  instance_type = "t2.micro"

  tags = {
    Name=var.instance-names[count.index]
  }
}

resource "aws_route53_record" "record" {
  count = 5
  zone_id = var.zone-id
  name    = "${var.instance-names[count.index]}.joindevops.online"  #interpolation mixing the variable and string we need to use the dollar and braces
  type    = "A"
  ttl     = 1
  records = [aws_instance.loop-condition[count.index].private_ip]  # Point to the public IP of the EIP
}