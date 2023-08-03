data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "prince"

  tags = {
    Name = var.ec2_name
  }
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "pripanwepiyucfgtr"  
  acl    = "private"  

}



