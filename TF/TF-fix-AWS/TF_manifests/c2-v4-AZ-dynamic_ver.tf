#list of AZ that supports my desired EC2 instance type
#data source block 1, we are to get the list of AZs dynamically
data "aws_availability_zones" "my_azones" {
  filter {
    name = "opt-in-status"  
    values = ["opt-in-not-required"]
  }
}
#data source block 2
data "aws_ec2_instance_type_offerings" "my_instance_type3" {
  for_each = toset(data.aws_availability_zones.my_azones.names)
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
# output "out_v2_1" {
#   description = "List of AZs that support my desired EC2 instance type"
#   #value       = data.aws_ec2_instance_type_offerings.my_instance_type1.instance_types
#   value = toset([for t in data.aws_ec2_instance_type_offerings.my_instance_type2 : t.instance_types])
# }

# #Map output
# #key - az, value - instance type supported
# output "out_v2_2" {
#   description = "Map of AZs that support my desired EC2 instance type"
#   value = {for az,t in data.aws_ec2_instance_type_offerings.my_instance_type2: az => t.instance_types}
# }

#basic output: all availability zones mapped to supported instance stypes
output "out_v3_1" {
  description = "Map of AZs that support my desired EC2 instance type"
  value = {for az,t in data.aws_ec2_instance_type_offerings.my_instance_type3: az => t.instance_types}
}

#filtered output, exclude az which don't support the desired instance type
output "out_v3_2" {
  description = "Map of AZs that support my desired EC2 instance type"
  value = {for az,t in data.aws_ec2_instance_type_offerings.my_instance_type3: az => t.instance_types if length(t.instance_types) != 0}

}

#we need list of AZ which only support our desired instance type i.e. we need key info
output "out_v3_3" {
  description = "Map of AZs that support my desired EC2 instance type"
  value = keys({for az,t in data.aws_ec2_instance_type_offerings.my_instance_type3: az => t.instance_types if length(t.instance_types) != 0})

}

#additional testing
#first value from this list
output "out_v3_4" {
  description = "Map of AZs that support my desired EC2 instance type"
  value = keys({for az,t in data.aws_ec2_instance_type_offerings.my_instance_type3: az => t.instance_types if length(t.instance_types) != 0})[0]

}