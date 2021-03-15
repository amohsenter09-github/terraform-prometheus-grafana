
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
