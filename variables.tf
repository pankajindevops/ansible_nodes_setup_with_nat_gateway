#File to Input the Variables that will be used across all .tf files

variable "AWS_REGION" {

  description = "Defines the AWS Region the Resources will be provisioned in"
  type        = string
  default     = "us-east-1"
}

variable "EC2_USER" {

  default = "ubuntu"
}

variable "AMI" {

  default = {

    eu-west-2 = "ami-0fb391cce7a602d1f"
    us-east-1 = "ami-052efd3df9dad4825"
    
    // Below is the AMI created from jenkins-on-ubuntu instance
    // us-east-1 = "ami-0956c4339e6835da1"
    
  }
}

variable "INSTANCE_TYPE" {
  default = "t2.small"

  validation {

    condition     = can(regex("^[Tt][2-3].(micro|small)", var.INSTANCE_TYPE))
    error_message = "Invalid EC2 Instance type name. You can only choose between - t2.micro OR t3.small"
  }
}

###########################################################
# New Variables Added
###########################################################

variable "INSTANCE_COUNT" {
  default = 1
}

variable "VPC_CIDR_BLOCK" {
  default = "10.0.0.0/16"
}

variable "INSTANCE_TENANCY" {
  default = "default"
}

variable "VPC_NAME" {
  default = "new_vpc"
}

variable "PUBLIC_SUBNET_CIDR_BLOCK_1" {
  default = "10.0.1.0/24"
}

variable "PUBLIC_SUBNET_CIDR_BLOCK_2" {
  default = "10.0.3.0/24"
}

variable "PRIVATE_SUBNET_CIDR_BLOCK_1" {
  default = "10.0.2.0/24"
}

variable "PRIVATE_SUBNET_CIDR_BLOCK_2" {
  default = "10.0.4.0/24"
}

variable "MAP_PUBLIC_IP_ON_LAUNCH" {
  default = "true"
}

variable "PUBLIC_SUBNET_AVAILABILITY_ZONE_1" {
  default = "us-east-1a"
}

variable "PUBLIC_SUBNET_AVAILABILITY_ZONE_2" {
  default = "us-east-1b"
}

variable "PRIVATE_SUBNET_AVAILABILITY_ZONE_1" {
  default = "us-east-1a"
}

variable "PRIVATE_SUBNET_AVAILABILITY_ZONE_2" {
  default = "us-east-1b"
}

variable "AWS_SECOND_REGION" {

  description = "Defines the Second AWS Region the Resources will be provisioned in"
  type        = string
  default     = "us-east-2"
}
