resource "aws_subnet" "main1" {
  depends_on = [
    "var.vpc1"
  ]
  vpc_id     = "${var.vpc2}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.az1a}"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "1-a"
  }
}
output "subnet1" {
       value = aws_subnet.main1.id
}

resource "aws_subnet" "main2" {
  depends_on = [
    "var.vpc1"
  ]
  vpc_id     = "${var.vpc2}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.az1b}"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "1-b"
  }
}
output "subnet2" {
       value = aws_subnet.main2.id
}