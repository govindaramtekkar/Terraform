data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami*amazon-ecs-optimized"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon", "self"]
}

resource "aws_launch_configuration" "default" {
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ecs.name
  image_id                    = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  key_name                    = "docker"

  lifecycle {
    create_before_destroy = true
  }

  name_prefix = "lauch-configuration-"

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  security_groups = [aws_security_group.ec2.id]
  user_data       = file("user_data.sh")

}