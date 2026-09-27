#TF output values
#EC2 instance public IP
output "instance_public_ip" {
  description = "Public IP of ec2 instance"
    value       = aws_instance.ec2-demo-tf.public_ip
}
#EC2 instance public DNS
output "instance_public_dns" {
  description = "Public DNS of ec2 instance"
  value       = aws_instance.ec2-demo-tf.public_dns
}