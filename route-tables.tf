
# Create Custom Route table for Public Subnet

resource "aws_route_table" "public-route-table" {

  vpc_id = aws_vpc.custom-vpc.id

  route {

    // Associated Subnet can reach everywhere
    cidr_block = "0.0.0.0/0"

    // Route table uses this IGW to reach the Internet
    gateway_id = aws_internet_gateway.prod-igw.id
  }

  tags = {
    "Name" = "public-route-table"
  }
}


# Create Custom Route table for Private Subnet

resource "aws_route_table" "private-route-table" {

  vpc_id = aws_vpc.custom-vpc.id

  route {

    // Associated Subnet can reach everywhere
    cidr_block = "0.0.0.0/0"

    // Route table uses this IGW to reach the Internet
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    "Name" = "prod-public-crt"
  }
}
