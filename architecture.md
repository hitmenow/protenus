# Task 2

1. Traffic received from the internet goes through the load balancer to an available container in the service.
2. For security, I might use an API gateway and require a secret key in the header of all requests.
3. For monitoring, I would use Cloudwatch to scrape ecs logs and verify a certain number of containers were running at any given time. Could also use cloudwatch synthetics to monitor the URL.
4. With multiple people working on the same terraform repo, I would use a statelock in a dynamodb table to prevent overwriting. Github for code management. For CD, could use github actions.
5. To reduce costs, I could use reserved ec2 instances instead of fargate.
