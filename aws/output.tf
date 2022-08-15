output "public_ip_addr" {
  value = aws_instance.web.public_ip
}

output "private_ip_addr" {
  value = aws_instance.web.private_ip
}
