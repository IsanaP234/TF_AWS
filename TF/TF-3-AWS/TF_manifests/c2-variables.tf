#Input variables
#AWS region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
#AWS EC2 Instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
#AWS EC2 instance key pair

variable "key_pair" {
  description = "Key pair name for EC2 instance"
  type        = string
  default     = "tf-test"
}

#list type variable of instance types
variable "instance_type_list" {
  description = "List of EC2 instance types"
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.medium"]
}
#map type variable of instance types
variable "instance_type_map" {
  description = "Map of EC2 instance types with their descriptions"
  type        = map(string)
  default     = {
    "dev"  = "t3.micro"
    "stage"  = "t3.small"
    "prod" = "t3.medium"
  }
}