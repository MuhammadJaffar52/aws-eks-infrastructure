# ─────────────────────────────────────────
# GET LATEST UBUNTU 22.04 AMI
# ─────────────────────────────────────────
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ─────────────────────────────────────────
# VPN SECURITY GROUP
# ─────────────────────────────────────────
resource "aws_security_group" "vpn_sg" {
  name        = "${var.project_name}-vpn-sg"
  description = "Security group for VPN server"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "OpenVPN UDP"
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-vpn-sg"
  }
}

# ─────────────────────────────────────────
# ELASTIC IP FOR VPN SERVER
# ─────────────────────────────────────────
resource "aws_eip" "vpn" {
  domain   = "vpc"
  instance = aws_instance.vpn_server.id

  tags = {
    Name = "${var.project_name}-vpn-eip"
  }
}

# ─────────────────────────────────────────
# VPN SERVER EC2 INSTANCE
# ─────────────────────────────────────────
resource "aws_instance" "vpn_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.vpn_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx

    cat > /etc/nginx/sites-available/default << 'NGINX'
    server {
        listen 80;
        server_name _;

        location /health {
            return 200 "VPN Proxy - Jenkins Ready\n";
            add_header Content-Type text/plain;
        }

        location / {
            proxy_pass http://localhost:8080;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_read_timeout 60s;
            proxy_connect_timeout 60s;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
        }
    }
    NGINX

    systemctl reload nginx
  EOF

  tags = {
    Name = "${var.project_name}-vpn-server"
  }
}
