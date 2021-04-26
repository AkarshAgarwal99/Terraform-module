resource "aws_route_table" "myroutetable" {
  depends_on = [
    "var.routegw"
  ]
  vpc_id = "${var.routevpcid}"
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.routegwid}"
  }
  tags = {
    Name = "MyrouteTable"
  }
}
output "Routetable" {
       value = aws_route_table.myroutetable.id
}
output "Route" {
       value = aws_route_table.myroutetable
}



resource "aws_route_table_association" "a" {
  subnet_id      = "${var.routesubid2}"
  route_table_id = "${var.routetbid}"
}
resource "aws_route_table_association" "b" {
  subnet_id      = "${var.routesubid1}"
  route_table_id = "${var.routetbid}"
}