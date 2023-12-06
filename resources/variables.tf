variable "region" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "vpc_name" {
  type        = string
  description = "Default name of VPC"
  default     = "erika-vpc"
}

variable "cidr" {
  type        = string
  description = "Default CIDR block"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zone values"
  default     = ["a", "b", "c"]
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}