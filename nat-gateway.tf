# nat-gateway.tf 
# Defines the NAT Gateway

resource "aws_nat_gateway" "nat_gateway" {

  depends_on = [
    aws_internet_gateway.prod-igw
  ]

  # Allocating the Elastic IP to the NAT Gateway!
  allocation_id = aws_eip.nat_gateway.id

  # Associating it in the Public Subnet!
  subnet_id = aws_subnet.subnet-public-1.id

  tags = {
    Name = "custom NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  # depends_on = [aws_internet_gateway.example]
}

resource "aws_eip" "nat_gateway" {

  vpc = true
}
