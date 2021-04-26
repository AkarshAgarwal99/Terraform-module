resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpcidtg}"
}
output "awstgarn" {
       value = aws_lb_target_group.test.arn
}
output "awstg" {
       value = aws_lb_target_group.test
}

//instance1
resource "aws_lb_target_group_attachment" "tgfori1" {
  target_group_arn = "${var.mytgarn}"
  target_id        = "${var.instance1id}"
  port             = 80
}

//instance2
resource "aws_lb_target_group_attachment" "tgfori2" {
  target_group_arn = "${var.mytgarn}"
  target_id        = "${var.instance2id}"
  port             = 80
}