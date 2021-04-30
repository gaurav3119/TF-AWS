
provider "aws" {
    region = "ap-south-1"
    shared_credentials_file = "C:/Users/JARVIS/Desktop/Creds AWS-TF/Credentials"
}


resource "aws_vpc" "My_VPC" {
  cidr_block       = var.cidr_blocks[count.index]
  instance_tenancy = "default"
  count = 2
  tags = {
    Name = "My_VPC-${count.index + 1}"
    }
}


resource "aws_subnet" "public-subnets_VPC1" {
  vpc_id                  = "${aws_vpc.My_VPC.*.id[0]}"
  cidr_block              = "${var.public_cidrs[count.index]}"
  availability_zone       = "${element(data.aws_availability_zones.azs.names, count.index)}"
  count                   = 2
  map_public_ip_on_launch = true

  tags = {
    Name = "publicsubnet-${count.index + 1}"
         }
}

resource "aws_subnet" "private-subnets_VPC1" {
  vpc_id                  = "${aws_vpc.My_VPC.*.id[0]}"
  cidr_block              = "${var.private_cidrs[count.index]}"
  availability_zone       = "${element(data.aws_availability_zones.azs.names, count.index)}"
  count                   = 2
  map_public_ip_on_launch = true

  tags = {
    Name = "privatesubnet-${count.index + 1}"
  }
}

resource "aws_subnet" "public-subnets_VPC2" {
  vpc_id                  = "${aws_vpc.My_VPC.*.id[1]}"
  cidr_block              = "${var.public_cidrs_vpc2[count.index]}"
  availability_zone       = "${element(data.aws_availability_zones.azs.names, count.index)}"
  count                   = 2
  map_public_ip_on_launch = true

  tags = {
    Name = "publicsubnet-${count.index + 1}"
         }
}

resource "aws_subnet" "private-subnets_VPC2" {
  vpc_id                  = "${aws_vpc.My_VPC.*.id[1]}"
  cidr_block              = "${var.private_cidrs_vpc2[count.index]}"
  // availability_zone       = "data.aws_availability_zones.azs.names[count.index]"
  count                   = 2
  map_public_ip_on_launch = true

  tags = {
    Name = "privatesubnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "IGW1" {
  vpc_id = aws_vpc.My_VPC.*.id[0]

  tags = {
    Name = "IGW"
  }
}


resource "aws_internet_gateway" "IGW2" {
  vpc_id = aws_vpc.My_VPC.*.id[1]

  tags = {
    Name = "IGW"
  }
}


// resource "aws_route_table" "example" {
//   vpc_id = aws_vpc.example.id

//   route {
//     cidr_block = "10.0.1.0/24"
//     gateway_id = aws_internet_gateway.example.id
//   }

//   tags = {
//     Name = "example"
//   }
// }