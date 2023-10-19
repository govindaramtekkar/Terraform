resource "aws_ecs_cluster" "production" {
  lifecycle {
    create_before_destroy = true
  }

  name = "production"

  tags = {
    Env  = "production"
   
  }
}