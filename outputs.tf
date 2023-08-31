###########################################
# Outputs Values to the Screen
###########################################

output "vpc_id" {
  description = "ID of the vpc"
  value       = aws_vpc.custom-vpc.id
}

output "instance_id" {
  description = "ID of EC2 instance"
  value       = aws_instance.ec2-instance[0].id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.ec2-instance[0].public_ip
}
