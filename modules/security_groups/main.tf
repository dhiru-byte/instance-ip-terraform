
##########################
# Security group with name
##########################
// SG to allow SSH connections from anywhere

resource "aws_security_group" "allow_ssh_pub" {
  name        = "${var.name}-allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from the internet"
    from_port   = 22
    to_port     = 22
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
    Name = "${var.name}-allow_ssh_pub"
  }
}

// SG to onlly allow SSH connections from VPC public subnets
# resource "aws_security_group" "allow_ssh_priv" {
#   name        = "${var.name}-allow_ssh_priv"
#   description = "Allow SSH inbound traffic"
#   vpc_id      = var.vpc_id

#   ingress {
#     description = "SSH only from internal VPC clients"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["10.0.0.0/16"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.name}-allow_ssh_priv"
#   }
# }
