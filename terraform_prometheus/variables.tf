
#Singapore regions

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

variable "aws_availability_zone" {
  description = "AWS availabitiy zone to launch servers."
  default     = "us-east-1a"
}

variable "aws_instance_type" {
  description = "AWS Instance type"
  default     = "t2.medium"
}


variable "PATH_TO_PUBLIC_KEY" {
  default = "prometheus_aws_rsa.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "prometheus_aws_rsa.pem"
}

variable "prometheus_access_name" {
  default = "prometheus_ec2_access"
}

# Ubuntu Server 20.04 LTS (HVM), SSD Volume Type
variable "aws_amis" {
  default = {
    us-east-1 = "ami-042e8287309f5df03"
  }
}

variable "name" {
  description = "Infrastructure name"
  default     = "Promethus_Server"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "11.0.0.0/16"
}

variable "prometheus_server_subnet_cidr1" {
  description = "Promethus Server Subnet CIDR"
  default     = "11.0.1.0/24"
}

variable "env" {
  description = "Environment"
  default     = "Prod"
}

