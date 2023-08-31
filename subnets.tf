/***
Creates 2 Public Subnet & 2 Private Subnet
**/

resource "aws_subnet" "subnet-public-1" {

  vpc_id = aws_vpc.custom-vpc.id

  cidr_block = var.PUBLIC_SUBNET_CIDR_BLOCK_1

  # makes this a public subnet
  # the only difference between a public and a private 
  # is this argument

  map_public_ip_on_launch = var.MAP_PUBLIC_IP_ON_LAUNCH

  availability_zone = var.PUBLIC_SUBNET_AVAILABILITY_ZONE_1

}


resource "aws_subnet" "subnet-public-2" {

  vpc_id = aws_vpc.custom-vpc.id

  cidr_block = var.PUBLIC_SUBNET_CIDR_BLOCK_2

  # makes this a public subnet
  # the only difference between a public and a private 
  # is this argument

  map_public_ip_on_launch = var.MAP_PUBLIC_IP_ON_LAUNCH

  availability_zone = var.PUBLIC_SUBNET_AVAILABILITY_ZONE_2

}


resource "aws_subnet" "subnet-private-1" {

  vpc_id = aws_vpc.custom-vpc.id

  cidr_block = var.PRIVATE_SUBNET_CIDR_BLOCK_1

  # makes this a public subnet
  # the only difference between a public and a private 
  # is this argument

  #  map_public_ip_on_launch = var.MAP_PUBLIC_IP_ON_LAUNCH

  availability_zone = var.PRIVATE_SUBNET_AVAILABILITY_ZONE_1

}


resource "aws_subnet" "subnet-private-2" {

  vpc_id = aws_vpc.custom-vpc.id

  cidr_block = var.PRIVATE_SUBNET_CIDR_BLOCK_2

  # makes this a public subnet
  # the only difference between a public and a private 
  # is this argument

  #  map_public_ip_on_launch = var.MAP_PUBLIC_IP_ON_LAUNCH

  availability_zone = var.PRIVATE_SUBNET_AVAILABILITY_ZONE_2

}

