
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "ap-south-1"
}

variable "availability_zones" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "cidr_block" {
  default = "10.1.0.0/16"
}

variable "env" {
  description = "Targeted Deployment environment"
  default     = "Development"
}

variable "python_project_repository_branch" {
  description = "Python Project Repository branch to connect to"
  default     = "master"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "artifact-bucket-ecs-cicd"
}

variable "container_port" {
  description = "python app container port"
  default     = 5002
}


variable "container_name" {
  default = "python-app"
}

variable "ecs_image_ami" {
  type    = string
  # default = "ami-06b72b3b2a773be2b"
  default = "ami-0c918054e678b9da6"
  # aws ssm get-parameters --names /aws/service/ecs/optimized-ami/amazon-linux-2/recommended
}

variable "ACCOUNT_ID" {
  # type    = number
  default = 528462248584
}