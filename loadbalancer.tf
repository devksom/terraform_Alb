#Create an Application Load Balancer
resource "aws_lb" "application_lb" {
  name               = "myalbtf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb_sg.id]
  subnets = [aws_subnet.subnet2.id, aws_subnet.subnet1.id]
  #subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = false

  #   access_logs {
  #     bucket  = aws_s3_bucket.lb_logs.bucket
  #     prefix  = "test-lb"
  #     enabled = true
  #   }

  tags = {
    Environment = "production"
  }
}

#Create an ALB Listener
resource "aws_lb_listener" "my_alb_listener" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = "80"
  protocol          = var.protocol
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_targets.arn
  }
}

#Create Target Group
resource "aws_lb_target_group" "my_targets" {
  name     = "mytargetgroups"
  port     = var.http_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
   health_check {
    interval            = 10 #10 seconds
    path                = "/"
    port                = 80 
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             =3
    protocol            = "HTTP"
    matcher             = "200,202"
  }
}
#Create target group attachment for webserver 1
resource "aws_lb_target_group_attachment" "attach-web1" {
  target_group_arn = aws_lb_target_group.my_targets.arn
  target_id = aws_instance.web1.id
  port = 80
}
#Create target group attachment for Webserver 2
resource "aws_lb_target_group_attachment" "attach-web2" {
  target_group_arn = aws_lb_target_group.my_targets.arn
  target_id = aws_instance.web2.id
  port = 80
}
