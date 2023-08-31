# Associate the Public Route Table and the Public Subnet 1

resource "aws_route_table_association" "public-subnet-1" {

  # Public Subnet ID
  subnet_id = aws_subnet.subnet-public-1.id

  #  Route Table ID
  route_table_id = aws_route_table.public-route-table.id
}


# Associate the Public Route Table and the Public Subnet 2

resource "aws_route_table_association" "public-subnet-2" {

  # Public Subnet ID
  subnet_id = aws_subnet.subnet-public-2.id

  # Route Table ID
  route_table_id = aws_route_table.public-route-table.id
}


# Creating an Route Table Association of the NAT Gateway route 
# table with the Private Subnet!

resource "aws_route_table_association" "Nat-Gateway-RT-Association" {

  depends_on = [
    aws_route_table.private-route-table
  ]

  #  Private Subnet ID for adding this route table to the 
  #  DHCP server of Private subnet!
  subnet_id = aws_subnet.subnet-private-1.id

  #  Route Table ID
  route_table_id = aws_route_table.private-route-table.id
}
