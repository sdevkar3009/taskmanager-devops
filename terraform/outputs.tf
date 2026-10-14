output "instance_public_ip" {
  description = "Public IP of the k3s node - use this to SSH in and pull kubeconfig"
  value       = aws_instance.k3s_node.public_ip
}

output "ecr_repository_url" {
  description = "ECR repository URL - used by CI/CD to push Docker images"
  value       = aws_ecr_repository.app_repo.repository_url
}

output "app_url" {
  description = "URL to access the deployed app once k8s manifests are applied"
  value       = "http://${aws_instance.k3s_node.public_ip}:30080"
}
