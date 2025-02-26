resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Ubuntu 20.04 LTS AMI (update this based on your region)
  instance_type = "t2.micro"

  key_name      = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "UbuntuEC2"
  }

  # Optional: Provision the instance with a basic script to print a message
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /home/ubuntu/hello.txt
              EOF
}

output "instance_public_ip" {
  value = aws_instance.ubuntu_instance.public_ip
}
