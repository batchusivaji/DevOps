
resource "aws_vpc" "nvpc" {
  cidr_block = "192.168.0.0/16"
  tags {
    Name = "nvpc"
  }
}


resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.nvpc.id}"
  cidr_block = "192.168.0.0/24"
  tags {
    Name = "public"
   }
}

resource "aws_subnet" "web-1" {
  vpc_id = "${aws_vpc.nvpc.id}"
  cidr_block = "192.168.1.0/24"
  tags {
    Name = "web-1"
   }
}

resource "aws_subnet" "db-1" {
  vpc_id = "${aws_vpc.nvpc.id}"
  cidr_block = "192.168.2.0/24"
  tags {
    Name = "db-1"
   }
}

