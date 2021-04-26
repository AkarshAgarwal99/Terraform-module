resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "namratavpc"
  }
}
output "vpc1" {
       value = aws_vpc.main
}
output "vpc2" {
       value = aws_vpc.main.id
}