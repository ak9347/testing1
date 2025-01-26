output "private_ips"{
    value = aws_instance.loop-condition[*].private_ip  #since it is a list we gave the *
}