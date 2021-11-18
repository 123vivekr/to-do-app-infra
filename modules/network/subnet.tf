# Subnet
resource "aws_subnet" "main_public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "main_public_1"
    Pair = "Team 1"
  }
}


resource "aws_subnet" "main_public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "main_public_2"
    Pair = "Team 1"
  }
}

resource "aws_subnet" "main_public_3" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1c"

  tags = {
    Name = "main_public_3"
    Pair = "Team 1"
  }
}
