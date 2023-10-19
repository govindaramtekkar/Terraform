
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
   enable_dns_support   = true
    enable_dns_hostnames = true

  tags = {
    Env  = "production"
    Name = "vpc"
  }
}
# public subnet
resource "aws_subnet" "public__a" {
  availability_zone       = "ap-south-1a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Env  = "production"
    Name = "public-us-east-1a"
  }

  vpc_id = aws_vpc.default.id
}

resource "aws_subnet" "public__b" {
  availability_zone       = "ap-south-1b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Env  = "production"
    Name = "public-us-east-1b"
  }

  vpc_id = aws_vpc.default.id
}

#internate gatway
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id

  tags = {
    Env  = "production"
    Name = "internet-gateway"
  }
}
# route_table

resource "aws_route_table" "public" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Env  = "production"
    Name = "route-table-public"
  }

  vpc_id = aws_vpc.default.id
}

# route table association
resource "aws_route_table_association" "public__a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public__a.id
}

resource "aws_route_table_association" "public__b" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public__b.id
}

# mainn route

resource "aws_main_route_table_association" "default" {
  route_table_id = aws_route_table.public.id
  vpc_id         = aws_vpc.default.id
}