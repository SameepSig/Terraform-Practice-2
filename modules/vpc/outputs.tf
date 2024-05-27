output "sameep_terraform_vpc" {
    value = "${aws_vpc.sameep_terraform_vpc.id}"
}

# output "sameep_sg" {
#     description = "The ID of the security group"
#     value = "${aws_security_group.sameep_sg.id}"
# }

# output "sameep_terraform_subnet_1"{
#     description = "The ID of the public subnet"
#     value = "${aws_subnet.sameep_terraform_subnet_1.id}"
# }