data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_key_pair" "ssh" {
  key_name = "MyKey"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "test"
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.ssh.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "test"
  }
}
