#create webserver
resource "aws_instance" "web1" {
  ami           = "ami-094125af156557ca2" #us-west2
  instance_type = "t2.micro"
 associate_public_ip_address = true
  subnet_id = aws_subnet.subnet1.id
  security_groups = [aws_security_group.webserver_sg.id]
  
  tags = {
    web = "web-1"
  }
  user_data = <<EOF
  #!/bin/bash
  sudo yum update
  sudo yum install httpd -y
  sudo service httpd start
  echo "Hey, it's a me, WEB 1!" > /var/www/html/index.html
EOF

}
#create webserver 2
resource "aws_instance" "web2" {
  ami           = "ami-094125af156557ca2" #us-west2
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id =  aws_subnet.subnet2.id
 security_groups = [aws_security_group.webserver_sg.id]
  
  tags = {
    web = "web-2"
  }
  user_data = <<EOF
  #!/bin/bash
  sudo yum update
  sudo yum install httpd -y
  sudo service httpd start
  echo "Hey, it's a me, WEB 2!" > /var/www/html/index.html
EOF

}