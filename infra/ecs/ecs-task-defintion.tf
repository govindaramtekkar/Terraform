resource "aws_ecs_task_definition" "default" {
  container_definitions    = file("container_definitions.json")
  family                   = "blog"
  memory                   = 500
  network_mode             = "host"
  requires_compatibilities = ["EC2"]
}