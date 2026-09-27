#create security group - allow SSH traffic
resource "aws_security_group" "vpc-ssh" {
  name   = "vpc-ssh"
  description = "Allow SSH inbound traffic in dev env"
  #vpc_id = aws_vpc.example.id : No need for this right now as we will create this in our default VPC

  #inbound rule to allow SSH traffic from anywhere
  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #default outbound rule for secrity groups, terraform doesn't provide this by default, we need to define this
  #Usually provided by default when we create SG via console
  egress  {
    description = "allow all IPs and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "vpc-ssh"
  }
}

#create security group - allow HTTP traffic

resource "aws_security_group" "vpc-web" {
  name   = "vpc-web"
  description = "Allow HTTP inbound traffic in dev env"
  #vpc_id = aws_vpc.example.id : No need for this right now as we will create this in our default VPC

  #inbound rule to allow HTTP traffic from anywhere
  #ingress nested block is used to define the inbound rule for the security group. We can have multiple ingress blocks to allow multiple ports.
  ingress {
    description = "allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #list item
  }
  ingress {
    description = "allow port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #list item
  }
  #default outbound rule for secrity groups, terraform doesn't provide this by default, we need to define this
  #Usually provided by default when we create SG via console
  #egress nested block is used to define the outbound rule for the security group. We can have multiple egress blocks to allow multiple ports.
  egress {
    description = "allow all IPs and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "vpc-web"
  }
}