variable "aws_region" {
  type        = string
  description = "Region for AWS Resources"
  default     = "us-west-2" #Oregon
}
variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS Support"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_cidr" {
  type        = string
  description = "CIDR for internet"
  default     = "0.0.0.0/0"
}

variable "vpc_subnets_cidr_blocks" {
  type        = list(string)
  description = "CIDR Blocks for Subnets in VPC"
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instance"
  default     = "t2.micro"
}

variable "availability_zones" {
  type        = list(string)
  description = "list of availability zones"
  default     = ["us-west-2a", "us-west-2b"]
}
variable "protocol" {
  type=string
  description="Allowed protocol"
  default = "HTTP"
}
variable "http_port" {
  type        = number
  description = "HTTP Port"
  default     = 80

}