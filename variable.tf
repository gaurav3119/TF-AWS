data "aws_availability_zones" "azs" {}

variable "cidr_blocks" {
    default = ["10.0.0.0/16", "11.0.0.0/16"]
}


variable "public_cidrs" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "private_cidrs" {
    default = ["10.0.3.0/24","10.0.4.0/24"]
}



variable "public_cidrs_vpc2" {
    default = ["11.0.1.0/24","11.0.2.0/24"]
}

variable "private_cidrs_vpc2" {
    default = ["11.0.3.0/24","11.0.4.0/24"]
}