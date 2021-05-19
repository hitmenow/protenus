resource "aws_lb" "nginx" {
  name               = "nginx-lb-tf"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nginx-lb.id]
  subnets            = var.subnet_ids

  tags = {
    Application = "nginx"
    Environment = "production"
  }
}

resource "aws_lb_target_group" "nginx" {
  name     = "nginx-lb-tg"
  port     = 80
  target_type = "ip"
  vpc_id = var.vpc_id
  protocol = "HTTP"
  health_check {
    matcher = "200"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "redirect"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_security_group" "nginx-lb" {
  name        = "nginx-lb"
  description = "Allow http inbound traffic"
  ingress {
    # TLS (change to whatever ports you need)
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    # TLS (change to whatever ports you need)
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-lb"
  }
}
