resource "aws_instance"  "instance1-a" {
  depends_on = [
    "var.routetable"
  ]
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.security_g}"]
  key_name = "${var.Mykey}"
}
output "awsins1id" {
       value = aws_instance.instance1-a.id
}

resource "aws_instance"  "instance1-b" {
  depends_on = [
    "var.routetable"
  ]
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet2id}"
  vpc_security_group_ids = ["${var.security_g_two}"]
  key_name = "${var.Mykey}"
}
output "awsins2id" {
       value = aws_instance.instance1-b.id
}

