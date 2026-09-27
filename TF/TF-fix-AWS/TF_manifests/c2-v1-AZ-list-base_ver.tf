#list of AZ that supports my desired EC2 instance type
#data source block 
data "aws_ec2_instance_type_offerings" "my_instance_type1" {
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = ["us-east-1e"]
  }

  location_type = "availability-zone"
}

#output block is used to display the list of AZs that support the desired EC2 instance type
output "out_v1_1" {
  description = "List of AZs that support my desired EC2 instance type"
  value       = data.aws_ec2_instance_type_offerings.my_instance_type1.instance_types
}