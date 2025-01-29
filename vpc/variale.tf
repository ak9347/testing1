variable "ingress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Ensure it's a list
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Ensure it's a list
    }
  ]
}# variable "ingress" {
#     type = list
#     default = [
#         {
#             from_port = 80
#             to_port = 80
#             protocol = "tcp"
#             cidr_block = ["0.0.0.0/0"]
#         },
#         {
#             from_port   = 22    #the requets form this ports is allowed 0 menas the rquest form all the port are allowed
#             to_port     = 22
#             protocol    = "tcp"
#             cidr_blocks = ["0.0.0.0/0"] 
#         }
#     ]
# }