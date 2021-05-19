data "aws_route53_zone" "primary" {
  name = "test.com."
  private_zone = true
}

resource "aws_route53_record" "nginx" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name = "hello"
  type = "CNAME"
  ttl = "5"

  records = [aws_lb.nginx.dns_name]
}
