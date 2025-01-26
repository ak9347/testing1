variable "ami-id"{
    type = string
    default = "ami-0b4f379183e5706b9"
}

variable "instance-type"{
    type = string
    default = "t2.micro"
}

variable "security"{
    type = string #optional
    default = "allow-all"
}

variable "security-cidr"{
    type = list #because cidr is in brackets , it is a list
    default = ["0.0.0.0/0"] 
}

variable "tags-of-instance"{
    type = map
    default = {
        Name = "Database"
        Environment = "QA"
        Terraform = "True"
        Project = "Practice"
        Component = "MangoDb"
    }
}