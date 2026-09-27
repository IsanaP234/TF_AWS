resource "aws_instance" "ec2-demo-tf" {
  ami           = data.aws_ami.amzlinux2.id # Amazon Linux AMI ID assigned from data source once it received the data from amazon
  instance_type = var.instance_type #variable instance type
  key_name      = var.key_pair #variable key pair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id] #security group IDs assigned from the security groups created previously
  user_data = file("${path.module}/app1-install.sh") #this is the script that will be executed when the instance is launched    
  tags = {
    Name = "ec2-demo-tf-2"
  }
}