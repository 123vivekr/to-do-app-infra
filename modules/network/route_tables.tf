# route tables
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gw.id
  }

  tags = {
    Name = "main_rt"
    Pair = "Team 1"
  }
}

# route associations public
resource "aws_route_table_association" "main_1_a" {
  subnet_id      = aws_subnet.main_public_1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "main_2_a" {
  subnet_id      = aws_subnet.main_public_2.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "main_3_a" {
  subnet_id      = aws_subnet.main_public_3.id
  route_table_id = aws_route_table.main.id
}