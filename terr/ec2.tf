module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins_instance"

  instance_type          = "t2.small"
  key_name               = "jenkins"
  ami                    = "ami-04b4f1a9cf54c11d0"
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  subnet_id              = data.aws_subnet.default.id

  tags = {
    Environment = "dev"
  }
  user_data = <<-EOF
                #!/bin/bash
                echo "Hello bello" >  /home/hello.txt
                EOF
}

data "aws_subnet" "default" {

  vpc_id = data.aws_vpc.default.id

  filter {
    name   = "availabilityZone"
    values = ["us-east-1a"]
  }

}
#

