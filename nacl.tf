# create VPC Network Access Control List

resource "aws_network_acl" "My_VPC_Security_ACL" {

  vpc_id = aws_vpc.custom-vpc.id

  # subnet_ids = [aws_subnet.My_VPC_Subnet.id]

  subnet_ids = [aws_subnet.subnet-public-1.id]

  # allow ingress port 22 for SSH
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    // cidr_block = var.VPC_CIDR_BLOCK

    cidr_block = "0.0.0.0/0"

    from_port  = 22
    to_port    = 22
  }

  # allow ingress port 80 for HTTP
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  # allow ingress port 443 for HTTPS
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # allow ingress port for Jenkins Server
  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8080
    to_port    = 8080
  }


  # allow ingress ephemeral ports 
  ingress {
    protocol   = "tcp"
    rule_no    = 500
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }


  ############################################
  #     Egress Section
  ############################################

  # allow egress port 22 for SSH Traffic
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  # allow egress port 80 for HTTP Traffic
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }


  # allow egress port 443 for HTTPS Traffic
  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }


  # allow egress port 8080 for Jenkins Traffic
  egress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8080
    to_port    = 8080
  }


  # allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 500
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "custom nacl"
  }

} # end NACL resource