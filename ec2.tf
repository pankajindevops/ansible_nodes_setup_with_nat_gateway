
# Create AWS EC2 Instance

resource "aws_instance" "ec2-instance" {

  ami           = lookup(var.AMI, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE

  key_name      = "05-august-2023-key-pair"
  count         = var.INSTANCE_COUNT
	user_data     = file("jenkins.sh")

  # VPC
  subnet_id = aws_subnet.subnet-public-1.id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.security-group.id}"]


  # Output the Public IP of EC2 Instance to text file
  provisioner "local-exec" {

    command = "echo ${self.public_ip}  > public-ip.txt"
    # command = "echo `date +"%Y-%m-%d %T"` >> public-ip.txt"
  }

  # tags can also be setup as a Variable
  	tags = {
		
    Name = "jenkins-server"

	}
}
