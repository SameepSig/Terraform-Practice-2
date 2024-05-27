module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
}

module "subnet" {
    source = "./modules/subnet"
    vpc_id = module.vpc.sameep_terraform_vpc
    subnet_cidr = var.subnet_cidr
    subnet_cidr_public_2 = var.subnet_cidr_public_2
    subnet_cidr_private_1 = var.subnet_cidr_private_1
    subnet_cidr_private_2 = var.subnet_cidr_private_2
    
}

module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.sameep_terraform_vpc
    all_cidr_block = var.all_cidr_block
}

#  module "ec2" {
#     source = "./modules/ec2"
#     security_group_id = module.vpc.sameep_sg
#     subnet_id = module.vpc.sameep_terraform_subnet_1
# }

# module "s3" {
#     source = "./modules/s3"
# }
