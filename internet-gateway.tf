
# Create AWS Internet Gateway / Route Table / Security Group / Network ACLs

resource "aws_internet_gateway" "prod-igw" {

  vpc_id = aws_vpc.custom-vpc.id

  tags = {
    "Name" = "prod-igw"
  }
}
