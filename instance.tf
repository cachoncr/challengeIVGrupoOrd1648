resource "aws_instance" "server1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet1.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_icmp_ssh.id, aws_security_group.allow_http_https.id]
  private_ip                  = "192.168.28.1"
  key_name                    = var.key1
  user_data                   = file("user-data.sh")

  tags = {
    Name        = "server-ORD1648"
    Owner       = "student_12"
    Environment = "develop"
    OS          = "amazon-linux"
  }
}