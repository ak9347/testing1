resource "aws_instance" "for-loop"{
    for_each = var.instance-type
    ami = var.ami-id
    instance_type = each.value
    tags ={
        Name = each.key
    }
}

#resource "aws_route53_record" "record" {
#  for_each = aws_instance.for-loop
#  zone_id = var.zone-id
#  name    = "${each.key}.joindevops.online"  #interpolation mixing the variable and string we need to use the dollar and braces
#  type    = "A"
#  ttl     = 1
#  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]  # Point to the public IP of the EIP
#}


#output "aws_info"{
#    value = aws_instance.for-loop
#}