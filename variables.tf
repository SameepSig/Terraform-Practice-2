variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    default = "10.0.0.0/16"  
    type = string
}

variable "subnet_cidr" {
    description = "value of subnet cidr"
    default = "10.0.1.0/24"
    type = string
}

variable "subnet_cidr_public_2" {
    description = "value of public subnet cidr 2"
    default = "10.0.2.0/24"
    type = string
}

variable "subnet_cidr_private_1" {
    description = "value of private subnet cidr 1"
    default = "10.0.3.0/24"
    type = string
}

variable "subnet_cidr_private_2" {
    description = "value of private subnet cidr 2"
    default = "10.0.4.0/24"
    type = string
}

variable "all_cidr_block" {
    description = "All CIDR block i.e 0.0.0.0/0"
    default = "0.0.0.0/0"
    type = string
}