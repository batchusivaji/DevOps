
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.nvpc.id}"

}

resource "aws_route_table" "route" {
  tags {
      name = "route"
  }
  vpc_id = "${aws_vpc.nvpc.id}"

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
} 
  }

resource "aws_route_table_association" "ass" {

  subnet_id  = "${aws_subnet.web-1.id}"
  route_table_id = "${aws_route_table.route.id}"
}