
resource "aws_instance" "ubuntu" {

  ami = "ami-0565af6e282977273"
  instance_type = "t2.micro"
  key_name = "aws_jenkins"
  subnet_id  = "${aws_subnet.web-1.id}"
  vpc_security_group_ids = ["${aws_security_group.sgaws.id}"]
  associate_public_ip_address = true
  count = "1"
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = "${file("./aws_jenkins.pem")}"
    }
  provisioner "file" {
    source      = "./module/tomcat8.yaml"
    destination = "/home/ubuntu/tomcat8.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install software-properties-common",
      "sudo apt-add-repository --yes --update ppa:ansible/ansible",
      "sudo apt-get install ansible -y",
      "ansible-playbook /home/ubuntu/tomcat8.yaml"
    ]
  }
}
