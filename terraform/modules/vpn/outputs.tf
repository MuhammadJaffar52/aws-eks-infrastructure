output "vpn_server_public_ip" {
  description = "VPN server public IP"
  value       = aws_eip.vpn.public_ip
}

output "vpn_server_instance_id" {
  description = "VPN server instance ID"
  value       = aws_instance.vpn_server.id
}

output "vpn_security_group_id" {
  description = "VPN security group ID"
  value       = aws_security_group.vpn_sg.id
}
