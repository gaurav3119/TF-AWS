output "VPC_id" {
    value = aws_vpc.My_VPC.*.id
}

output "subnets_VPC1_id" {
    value = aws_subnet.public-subnets_VPC1.*.id
}

output "subnets_VPC2_id" {
    value = aws_subnet.public-subnets_VPC2.*.id
}