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
#for loop output as list of instances, this will return a list of public DNSs of all the instances created using count
output "instance_public_dns_list" {
  description = "Public DNSs of ec2 instances"
  value       = [for instance in aws_instance.ec2-demo-tf : instance.public_dns]
}

#for loop output as map of instances, this will return a map of public DNSs of all the instances created using count, the key will be the instance ID and the value will be the public DNS
output "instance_public_dns_map" {
  description = "Public DNSs of ec2 instances"
  value       = { for instance in aws_instance.ec2-demo-tf : instance.id => instance.public_dns }
}

#advanced map output using for loop
output "instance_public_dns_map_advanced" {
  description = "Public DNSs of ec2 instances"
  value = {for c,i in aws_instance.ec2-demo-tf : c => i.public_dns}

}
#here c is the count index and i is the instance object

#legacy splat operator output, this will return a list of public DNSs of all the instances created using count, but this is not recommended as it is less readable and less flexible than the for loop output
output "instance_public_dns_splat" {
  description = "Public DNSs of ec2 instances"
  value       = aws_instance.ec2-demo-tf.*.public_dns
}

#latest generalized splat operator output, this will return a list of public DNSs of all the instances created using count, but this is not recommended as it is less readable and less flexible than the for loop output
output "instance_public_dns_splat_latest" {
  description = "Public DNSs of ec2 instances"
  value       = aws_instance.ec2-demo-tf[*].public_dns
}
