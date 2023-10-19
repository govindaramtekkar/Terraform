
data "aws_ecr_repository" "default" {
  name = "blog"

 
}

output "repository_url" {
  value = data.aws_ecr_repository.default.repository_url
}