# resource "aws_instance" "sameep_terraform_ec2" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   subnet_id = var.vpc.subnet_id
#   vpc_security_group_ids = [var.security_group_id.id] # Attach the security group
#   associate_public_ip_address = true
#   key_name = var.key_name

#   tags = {
#     Name = "sameep-first-terraform-webserver"
#     silo = "intern2"
#     owner = "sameep.sigdel"
#     terraform = "true"
#     environment = "dev"
#   }
# }