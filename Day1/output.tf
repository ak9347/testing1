output "public_ip"{
    value = aws_instance.first-instance.public_ip
}