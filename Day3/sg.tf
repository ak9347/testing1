resource "aws_security_group" "allow-all" {     #here the security name is used in the terraform
  name        = "allow"  #name of the security group name in the AWS
  description = "Allow Http HTTPS SSH" 

  dynamic "ingress" {
    for_each = var.ingress
    content{
        from_port   = ingress.value["from_port"]    #the requets form this ports is allowed 0 menas the rquest form all the port are allowed
        to_port     = ingress.value["to_port"] 
        protocol    = ingress.value["protocol"] 
        cidr_blocks =  ingress.value["cidr_blocks"]  
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks =  ["0.0.0.0/0"]     # Allow all outbound traffic
  }
}