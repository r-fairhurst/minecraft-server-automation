resource "aws_instance" "minecraft" {
  ami           = var.ami_id
  instance_type = "t3.small"
  key_name      = "minecraft-key"
  vpc_security_group_ids = [aws_security_group.minecraft_sg.id]
  tags = {
    Name = "MinecraftServer"
  }
}

resource "aws_security_group" "minecraft_sg" {
  name        = "minecraft_sg"
  description = "Allow Minecraft traffic"

  ingress {
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "Allow SSH"
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
}
