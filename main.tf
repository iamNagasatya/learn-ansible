#Create and bootstrap webserver
resource "aws_instance" "webserver" {
  # ami                         = data.aws_ssm_parameter.webserver-ami.value
  for_each = var.instances
  ami = each.value.ami
  instance_type               = each.value.instance_type
  key_name                    = aws_key_pair.webserver-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  
  tags = each.value.tags
}

resource "ansible_host" "servers" {
  for_each = aws_instance.webserver
  name = each.value.public_ip
  groups = ["servers"]
  variables = {
    ansible_user = var.instances[each.key].default_username
  }
  depends_on = [ aws_instance.webserver[each.key] ]
}


