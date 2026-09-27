#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo yum update -y #basic package install on amazon linux 2 instance
sudo yum install -y httpd #instal httpd server i.e. apache web server
sudo systemctl enable httpd #enable the httpd service on boot
sudo service httpd start #then the service will be started
sudo echo '<h1>Welcome to StackSimplify - APP-1</h1>' | sudo tee /var/www/html/index.html
#In the above line, we are going to update the static index.html page with the welcome message
#The echo command will print the message and the tee command will write it to the index.html file. The sudo command is used to run the command as root user.
sudo mkdir /var/www/html/app1
#We will create a new directory called app1 in the /var/www/html directory. This is where we will store the application files.
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
#In the above line, we are going to create a new index.html file in the app1 directory with the welcome message and application version. The echo command will print the message and the tee command will write it to the index.html file. 
#sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
sudo curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
#the first command gets permission to query EC2 metadata, and the second command uses that permission to get information about the EC2 instance and saves it as a file that a web server can serve
#we will get the instance metadata and write it to a file called metadata.html in the app1 directory. The curl command will retrieve the metadata and the tee command will write it to the metadata.html file. 

# AWS Documentation to retrieve EC2 Instance Data
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html



 