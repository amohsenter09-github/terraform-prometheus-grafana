
# Below are the aws key pair
resource "aws_key_pair" "prometheus_key_pair" {
  key_name   = "prometheus_aws_rsa"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "prometheus_instance" {
  ami                    = lookup(var.aws_amis, var.aws_region)
  instance_type          = var.aws_instance_type
  availability_zone      = var.aws_availability_zone
  user_data              = data.template_file.script.rendered
  iam_instance_profile   = aws_iam_instance_profile.prometheus_profile.name
  key_name               = aws_key_pair.prometheus_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.prometheus_security_group.id]
  subnet_id              = aws_subnet.prometheus_subnet.id

  tags = {
    Name        = "${var.name}_instance"
    Environment = var.env
  }
}

data "template_file" "script" {
  template = file("${path.module}/script.sh")

}












# # prometheus instance
# resource "aws_instance" "prometheus_instance" {
#   ami               = lookup(var.aws_amis, var.aws_region)
#   instance_type     = var.aws_instance_type
#   availability_zone = var.aws_availability_zone

#   key_name               = aws_key_pair.prometheus_key_pair.key_name
#   vpc_security_group_ids = [aws_security_group.prometheus_security_group.id]
#   subnet_id              = aws_subnet.prometheus_subnet.id

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     timeout     = "5m"
#     host        = self.public_ip
#     private_key = file("prometheus_aws_rsa.pem")
#   }

#   # Copy the prometheus file to instance
#   provisioner "file" {
#     source      = "./prometheus.yml"
#     destination = "/tmp/prometheus.yml"
#   }
#   # Install docker in the ubuntu

#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt update",
#       "sudo apt -y install apt-transport-https ca-certificates curl software-properties-common",
#       "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
#       "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'",
#       "sudo apt update",
#       "sudo apt -y install docker-ce",
#       "sudo apt -y install docker-compose",
#       "git clone https://github.com/Einsteinish/Docker-Compose-Prometheus-and-Grafana.git",
#       "cd Docker-Compose-Prometheus-and-Grafana/",
#       " docker-compose up -d"




#       # "sudo mkdir /prometheus-data",
#       # "sudo docker run -d - 9090:9090 --name=promrtheus prom/prometheus:main"
#       # # "sudo cp /tmp/prometheus.yml /prometheus-data/.",
#       # # "sudo sed -i 's;<access_key>;${aws_iam_access_key.prometheus_access_key.id};g' /prometheus-data/prometheus.yml",
#       # # "sudo sed -i 's;<secret_key>;${aws_iam_access_key.prometheus_access_key.secret};g' /prometheus-data/prometheus.yml",
#       # # "sudo docker run -d -p 9090:9090 --name=prometheus -v /prometheus-data/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus",
#       # "sudo docker run -d -p 3000:3000 --name=grafana grafana/grafana"

#     ]
#   }
#   # provisioner "local-exec" {
#   #   command = "echo '${tls_private_key.sskeygen_execution.private_key_pem}' >> ${aws_key_pair.prometheus_key_pair.id}.pem ; chmod 400 ${aws_key_pair.prometheus_key_pair.id}.pem"
#   # }

#   tags = {
#     Name        = "${var.name}_instance"
#     Environment = var.env
#   }
# }

