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

resource "aws_instance" "web" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = aws_key_pair.ssh.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  root_block_device {
    volume_size = 15
    delete_on_termination = true
  }

  tags = {
    Name = "test"
  }
}
