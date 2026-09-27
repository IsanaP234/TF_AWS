#create AMI datasource to get the latest Amazon Linux 2 AMI ID
data "aws_ami" "amzlinux2" {
  most_recent      = true #will fetch the latest AMI from AWS
  owners           = ["amazon"] #owner of the AMI, Amazon is the owner of Amazon Linux 2 AMI    

#we will add the filter by AMI name, root device type, virtualization type and architecture to get the latest Amazon Linux 2 AMI ID
  filter {
    name   = "name"
    values = ["al2023-ami-*"] #filter to get the latest Amazon Linux 2 AMI, al2023-ami-* is the name of the AMI
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}
