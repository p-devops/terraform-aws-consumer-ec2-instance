data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "this" {
  count = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  region = "us-east-1"


  tags = {
    Owner = "Consumer"
  }
}
