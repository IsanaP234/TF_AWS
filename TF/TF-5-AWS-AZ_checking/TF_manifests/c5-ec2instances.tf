#availability zones data source
# data "aws_availability_zones" "my_azones" {
#   filter {
#     name = "opt-in-status"  
#     values = ["opt-in-not-required"]
#   }
# }

resource "aws_instance" "ec2-demo-tf" {
  ami           = data.aws_ami.amzlinux2.id # Amazon Linux AMI ID assigned from data source once it received the data from amazon
  instance_type = var.instance_type #basic variable instance type
  #instance_type=var.instance_type_list[0] #variable instance type list
  #instance_type=var.instance_type_map["prod"] #variable instance type map
  key_name      = var.key_pair #variable key pair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id] #security group IDs assigned from the security groups created previously
  user_data = file("${path.module}/app1-install.sh") #this is the script that will be executed when the instance is launched    
  #count = 2 #this will create 2 instances of the same type with the same configuration, we can use count.index to get the index of the instance and use it in the tags to give unique names to the instances
  #count index is a built-in variable that is available when we use count, it starts from 0 and increments by 1 for each instance created
  # for_each = toset(data.aws_availability_zones.my_azones.names) #this will create instances in all the availability zones, we can use each.key to get the name of the availability zone and use it in the tags to give unique names to the instances
  for_each = toset(keys({for az,t in data.aws_ec2_instance_type_offerings.my_instance_type3: az => t.instance_types if length(t.instance_types) != 0}))
  availability_zone = each.key #this will assign the availability zone to the instance based on the availability zone name from the data source
  tags = {
    Name = "for_each_demo-${each.value}" #this will give unique names to the instances based on the availability zone they are created in
  }#here each.key and each.value are equivalent
}