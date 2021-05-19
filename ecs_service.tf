resource "aws_ecs_service" "nginx-hello" {
  name = "nginx-hello"
  cluster = aws_ecs_cluster.pro-cluster.id
  task_definition = aws_ecs_task_definition.nginx-hello.arn
  desired_count = 3
  launch_type = "FARGATE"
  
  network_configuration {
    subnets = var.subnet_ids
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.nginx.arn
    container_name = "nginx-hello"
    container_port = 80
  }
}
