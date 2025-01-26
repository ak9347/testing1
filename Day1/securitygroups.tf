resource "aws_security_group" "allow-all" {     #here the security name is used in the terraform
  name        = var.security  #name of the security group name in the AWS
  description = "Allow all the traffic" 

  ingress {
    from_port   = 0    #the requets form this ports is allowed 0 menas the rquest form all the port are allowed
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = var.security-cidr  # Allow HTTP traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.security-cidr  # Allow all outbound traffic
  }
}