resource "aws_subnet" "subnet1" {
  vpc_id                  = var.vpc1_id
  cidr_block              = "172.16.12.0/28"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "Subnet Grupo 12"
  }
}
resource "aws_route_table" "r" {
  vpc_id = var.vpc1_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
}

resource "aws_route_table_association" "table_subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.r.id
}