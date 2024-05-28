# # output "vpc_id" {
# #   value = module.vpc.vpc_id
# # }

# output "ec2" {
#     description = "The ID of the security group"
#     value = module.vpc.aws_security_group_id
# }

# output "sameep_terraform_subnet_1" {
#     description = "The ID of the public subnet"
#     value = module.vpc.sameep_terraform_subnet_1
# }

output website_url {
    description = "The URL of the static website"
    value      = module.s3.website_url
}