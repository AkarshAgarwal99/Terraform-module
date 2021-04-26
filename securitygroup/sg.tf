resource "aws_security_group" "allow_tls1" {
  depends_on = [
    "var.sgvpc"
  ]
  name        = "mywordpresssecurity"
  description = "Allow inbound traffic"
  vpc_id      = "${var.sgvpcid}"

  ingress {
    description = "mysecurity"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "${var.cidr}" ]
  }
  ingress {
    description = "mysecurity"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "${var.cidr}" ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "${var.cidr}" ]
  }

  tags = {
    Name = "security_group_1"
  }
}
output "sgword1" {
       value = aws_security_group.allow_tls1
}
output "sg1" {
       value = aws_security_group.allow_tls1.id
}
//---------------------------------------------------------------------------------------------------
resource "aws_security_group" "allow_tls2" {
  depends_on = [
    aws_security_group.allow_tls1
  ]
  name        = "mysql_security_group"
  description = "Allow_only_wordpress_traffic"
  vpc_id      = "${var.sgvpcid}"

  ingress {
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = [ "${var.cidr}" ]
  }
  
  ingress {
   from_port = 22
   to_port = 22
   protocol = "tcp"
   cidr_blocks = [ "${var.cidr}" ]
  }

  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = [ "${var.cidr}" ]
  }
}
output "sgword2" {
       value = aws_security_group.allow_tls1
}

output "sg2" {
       value = aws_security_group.allow_tls2.id
}