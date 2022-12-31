#Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}

#Create an Internet Gateway
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "main"
  }
}

#Create subnet 1
resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_subnets_cidr_blocks[0]
  availability_zone = var.availability_zones[0]
}
#Create Route Table for subnet1
resource "aws_route_table" "prv_sub1_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.myigw.id

  }
  tags = {

    Name = "route table"
  }
}
# Create route table association of private subnet1
resource "aws_route_table_association" "internet_for_prv_sub1" {
  route_table_id = aws_route_table.prv_sub1_rt.id
  subnet_id      = aws_subnet.subnet1.id
}

#create Subnet 2
resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.vpc_subnets_cidr_blocks[1]
  availability_zone = var.availability_zones[1]
}

#Create Route Table for subnet 2
resource "aws_route_table" "prv_sub2_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.public_cidr
    gateway_id = aws_internet_gateway.myigw.id

  }
  tags = {

    Name = "route table"
  }
}
# Create route table association of private subnet 2
resource "aws_route_table_association" "internet_for_prv_sub2" {
  route_table_id = aws_route_table.prv_sub2_rt.id
  subnet_id      = aws_subnet.subnet2.id
}

