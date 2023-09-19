resource "aws_key_pair" "key" {
  key_name = "aws-key"
  public_key = var.public_key
}

resource "aws_instance" "zabbix_server" {
  count                       = var.instance.settings.count
  ami                         = var.instance.settings.ami
  instance_type               = var.instance.settings.type
  subnet_id                   = var.instance.settings.subnet_id
  security_groups             = [var.instance.settings.security_group]
  key_name                    = aws_key_pair.key.key_name
  associate_public_ip_address = true

  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> hosts.txt"
  }

  tags = {
    Name = "Server ${count.index}"
  }
}
