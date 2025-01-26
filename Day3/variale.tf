variable "ami-id"{
    default = "ami-0b4f379183e5706b9"
}

#variable "instance-name" {
#    type = list
#    default = ["MangoDb","redis","catalogue","cat"]
#}

variable "instance-type" {
    type = map
    default = {
        MangoDb = "t3.micro"
        redis  = "t3.micro"
        catalogue = "t2.micro"
        cat = "t2.micro"
    }
}

variable "ingress"{
    type =list
    default =[
        {
            from_port   = 80    #the requets form this ports is allowed 0 menas the rquest form all the port are allowed
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]   
        },
        {
            from_port   = 22    #the requets form this ports is allowed 0 menas the rquest form all the port are allowed
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"] 
        },
        {
            from_port   = 443    #the requets form this ports is allowed 0 menas the rquest form all the port are allowed
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"] 
        }

    ]
}