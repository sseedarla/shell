
resource "aws_instance" "sample" {
  ami                     = "ami-0b4f379183e5706b9"
  instance_type           = "t3.nano"

tags = { Name = "Sample"}
}