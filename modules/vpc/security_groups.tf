# resource "aws_security_group" "sameep_sg" {
#   name        = "sameep_sg_vpc_1_terraform"
#   description = "sameep aws securitygroup built using terraform"
#   vpc_id      = aws_vpc.sameep_terraform_vpc.id

#   ingress{
#     description = "sameep security group from terraform http"
#     cidr_blocks   = ["0.0.0.0/0"]
#     from_port   = 80
#     protocol = "tcp"
#     to_port     = 80
#   }

#   ingress{
#     description = "sameep security group from terraform ssh"
#     cidr_blocks   = ["0.0.0.0/0"]
#     from_port   = 22
#     protocol = "tcp"
#     to_port     = 22
#   }

#   egress{
#     description = "egress for all traffic"
#     from_port = 0
#     to_port = 0
#     protocol = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "sameep-aws-sg-terraform"
#     terraform = "true"
#     silo = "intern2"
#     owner = "sameep.sigdel"
#     environment = "dev"
#   }
# }