resource "aws_instance" "server1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet1.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_http_ssh.id]
  private_ip                  = "172.16.12.10"
  key_name                    = var.key1
  user_data                   = file("user-data.sh")

  tags = {
    Name        = "server-grupo-12"
    Owner       = "student_12"
    Environment = "develop"
    OS          = "amazon-linux"
  }
}