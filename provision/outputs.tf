output "Webserver-Public-IPs" {
  value = { for name, instance in aws_instance.webserver : name => instance.public_ip }
  description = "Public IPs of all webserver instances."
}
