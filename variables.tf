variable "vpc_id" {
	default = "vpc-d8f593bc"
}

variable "subnet_ids" {
	type = list
	default = ["subnet-8cf511a6","subnet-f865fbf4","subnet-ddd808ab"]
}
