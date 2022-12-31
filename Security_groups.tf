#Security Group for Load Balancer
resource "aws_security_group" "elb_sg" {
  name        = "loadbalancer_sg"
  description = "Security Group for Load Balancer"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = [var.public_cidr]
  }
  egress {
    from_port   = 0 #all ports
    to_port     = 0 #all ports
    protocol    = "-1" #all protocols
    cidr_blocks = [var.public_cidr]

  }

}

#Security Group for Webservers
resource "aws_security_group" "webserver_sg" {
  name        = "webserver_sg"
  description = "Security Group for Webserver"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    description = "HTTP"
    #cidr_blocks = [var.public_cidr]
   # source_security_group_id= aws_security_group.elb_sg.id
    security_groups = [aws_security_group.elb_sg.id]
  }
  egress {
    from_port   = 0 #all ports
    to_port     = 0 #all ports
    protocol    = "-1" #all protocols
    cidr_blocks = [var.public_cidr]

  }

}