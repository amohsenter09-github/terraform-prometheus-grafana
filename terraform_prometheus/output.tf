output "Grafana_URL" {
  value = "http://${aws_instance.prometheus_instance.public_ip}:3000"
}

output "Prometheus_URL" {
  value = "http://${aws_instance.prometheus_instance.public_ip}:9090"
}

output "node-exporter_URL" {
  value = "http://${aws_instance.prometheus_instance.public_ip}:9100"
}

output "alertmanager_URL" {
  value = "http://${aws_instance.prometheus_instance.public_ip}:9093"
}

output "pushgateway_URL" {
  value = "http://${aws_instance.prometheus_instance.public_ip}:9091"
}

output "cadvisor_URL" {
  value = "http://${aws_instance.prometheus_instance.public_ip}:8080"
}

output "instance_public_ip" {
  value       = aws_instance.prometheus_instance.public_ip
  description = "The public IP address of the Gitlab server instance"
}