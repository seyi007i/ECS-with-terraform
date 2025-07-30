data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = var.key.key_name
  subnet_id     = var.public_subnets_frontend["public_subnet_frontend_1"].id
  associate_public_ip_address = true
  security_groups             = [var.bastion_sg_id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              apt update -y
              apt install -y htop unzip awscli
              EOF
            )

  tags = {
    Name = "BastionHost"
  }
}
