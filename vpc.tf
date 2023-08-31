# Create the VPC

resource "aws_vpc" "custom-vpc" {

  cidr_block = var.VPC_CIDR_BLOCK

  # gives an Internal Domain Name
  enable_dns_support = true

  # gives an Internal Host Name
  enable_dns_hostnames = true

  instance_tenancy = var.INSTANCE_TENANCY

  tags = {

    Name = var.VPC_NAME

  }
}
