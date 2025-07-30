resource "aws_security_group" "allow_backend" {
  name        = "allow_backend"
  description = "Allow backend inbound traffic"
  vpc_id      = var.vpc_id 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ var.public_subnets_frontend["public_subnet_frontend_1"].cidr_block,
                     var.public_subnets_frontend["public_subnet_frontend_2"].cidr_block,
                     var.private_subnets_backend["private_subnet_backend_1"].cidr_block,
                     var.private_subnets_backend["private_subnet_backend_2"].cidr_block              
                     ]
  }

  ingress { 
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      var.public_subnets_frontend["public_subnet_frontend_1"].cidr_block,
      var.public_subnets_frontend["public_subnet_frontend_2"].cidr_block
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH from trusted IP"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Change to your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ALB Security Group
resource "aws_security_group" "alb_sg" {
  name        = "${var.name_prefix}-alb-sg"
  description = "Allow HTTP traffic to ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-alb-sg"
  }
}

resource "aws_security_group_rule" "alb_to_ecs" {
  type                     = "ingress"
  from_port                = var.container_port
  to_port                  = var.container_port
  protocol                 = "tcp"
  security_group_id        =  aws_security_group.ecs_instance_sg.id          # ECS instance SG
  source_security_group_id = var.alb_sg_id            # ALB SG (from module.alb.alb_sg_id)
  description              = "Allow traffic from ALB"
}

resource "aws_security_group" "ecs_instance_sg" {
  name        = "${var.name_prefix}-ecs-sg"
  description = "Allow traffic from ALB to ECS instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port                = var.container_port
    to_port                  = var.container_port
    protocol                 = "tcp"
    security_groups          = [var.alb_sg_id]  # If passed into this module
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-ecs-instance-sg"
  }
}
