
# Create a Security Group
# We'll use this Security Group for our EC2 Instance

# resource "aws_security_group" "ssh-allowed" {
resource "aws_security_group" "security-group" {

  vpc_id = aws_vpc.custom-vpc.id

  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    // this means All IP Addresses are allowed to SSH into the server
    // Do Not Do this Production
    // Put your Office or Home Address in it

    cidr_blocks = ["0.0.0.0/0"]
  }


  // If you Do Not Add this Rule, you can not reach the NGINX Server

  ingress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # Allow Ingress of all ports
  ingress {

    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }



  egress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # All IP Addresses are Allowed 
  }


  egress {

    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # All IP Addresses are Allowed 
  }

  egress {

    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # All IP Addresses are Allowed 
  }

  egress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {

    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"] # All IP Addresses are Allowed 
  }



  tags = {
    Name = "ssh-allowed"
  }

}
