variable "ami-id"{
    default = "ami-0b4f379183e5706b9"
}

#variable "instance-name" {
#    type = list
#    default = ["MangoDb","redis","catalogue","cat"]
#}

variable "zone-id" {
    default = "Z0379629165G52BGR6JDP"
}

variable "instance-type" {
    type = map
    default = {
        MangoDb = "t3.micro"
        redis  = "t3.micro"
        catalogue = "t2.micro"
        cat = "t2.micro"
    }
}