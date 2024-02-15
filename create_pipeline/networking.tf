resource "aws_vpc" "web_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true 
  tags = {
    Name = "VPC"
  }
}

resource "aws_subnet" "private_subnet" {

  count  = 2
  vpc_id = aws_vpc.web_vpc.id 
  cidr_block = cidrsubnet(var.cidr_block, 2, count.index) 
  availability_zone = element(var.availability_zones, count.index) 
  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}
 
resource "aws_internet_gateway" "web_igw" {
  vpc_id = aws_vpc.web_vpc.id
}
 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.web_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_igw.id
  }

  tags = {
    Name = "Public Subnet Route Table"
  }
}
 
resource "aws_subnet" "public_subnet" {

  count                   = 2
  vpc_id                  = aws_vpc.web_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 2, count.index + 2)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}


resource "aws_route_table_association" "public_subnet_rta" {
  count          = 2
  subnet_id      = aws_subnet.public_subnet.*.id[count.index]
  route_table_id = aws_route_table.public_rt.id
}
