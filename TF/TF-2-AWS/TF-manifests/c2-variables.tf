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