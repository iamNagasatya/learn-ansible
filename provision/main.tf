#Create and bootstrap webserver
resource "aws_instance" "webserver" {
  # ami                         = data.aws_ssm_parameter.webserver-ami.value
  for_each = var.ami_ids
  ami = each.value
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.webserver-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  
  tags = {
    Name = each.key
  }
}

resource "null_resource" "write_inventory" {
  depends_on = [aws_instance.webserver]

  provisioner "local-exec" {
    command = <<EOT
    echo "${join("\n", [for name, instance in aws_instance.webserver : "${instance.public_ip}"])}" > inventory.ini
    EOT
  }
}
