provider "aws"{
    region = "us-east-1"
}
resource "aws_instance" "WebServer" {
    ami           = "ami-0e2c8caa4b6378d8c"
    instance_type = "t2.micro"
    subnet_id     = "subnet-0d36ade25d5579061"
    tags = {
        Name        = "WebServer"
        Environment = "Development"
  }
}