resource "aws_ecs_task_definition" "nginx-hello" {
  family = "nginx-hello"
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  cpu = 256
  memory = 512
  container_definitions = jsonencode([
    {
      name      = "nginx-hello"
      image     = "nginxdemos/hello"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}
