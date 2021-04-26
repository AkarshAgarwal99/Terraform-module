resource "aws_lb" "myapplb" {
depends_on = [
    "var.tg"
  ]
  name               = "applicationlb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.lbsg}"]
  subnets            = ["${var.lbsub1}","${var.lbsub2}"]
  enable_deletion_protection = false
  tags = {
    Environment = "production"
  }
}
output "awsreallb" {
       value = aws_lb.myapplb.arn
}


resource "aws_lb_target_group" "lbtargetgroup" {
  name     = "tf-example-lb-tg"
  target_type = "${var.lbinstance}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpclbid}"
}
output "awslbarn" {
       value = aws_lb_target_group.lbtargetgroup.arn
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${var.lbrealarn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = "${var.lbtgarn}"
  }
}