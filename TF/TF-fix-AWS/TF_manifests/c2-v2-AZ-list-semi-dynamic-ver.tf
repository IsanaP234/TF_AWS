#list of AZ that supports my desired EC2 instance type
#data source block 
data "aws_ec2_instance_type_offerings" "my_instance_type2" {
  for_each = toset(["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = [each.key]
  }

  location_type = "availability-zone"
}

#in order to display the outputs we have to use for loop as we are using for_each
output "out_v2_1" {
  description = "List of AZs that support my desired EC2 instance type"
  #value       = data.aws_ec2_instance_type_offerings.my_instance_type1.instance_types
  value = toset([for t in data.aws_ec2_instance_type_offerings.my_instance_type2 : t.instance_types])
}

#Map output
#key - az, value - instance type supported
output "out_v2_2" {
  description = "Map of AZs that support my desired EC2 instance type"
  value = {for az,t in data.aws_ec2_instance_type_offerings.my_instance_type2: az => t.instance_types}
}