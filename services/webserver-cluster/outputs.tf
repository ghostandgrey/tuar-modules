output "alb_dns_name" {
  value = aws_lb.load_balancer.dns_name
  description = "The domain name of the load balancer"
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.example.name
  description = "The name of the Auto Scaling Group"
}