#resource block
resource "aws_instance" "ec2-demo-tf" {
  ami           = "ami-0fef201115eefe936" # Amazon Linux AMI
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh") #this is the script that will be executed when the instance is launched    
  tags = {
    Name = "ec2-demo-tf"
  }
}
