variable "env_name" {
  description = "Name of environment"
  default     = "Development"
}

variable "aws_region" {
  description = "AWS region to provision"
  default     = "ap-south-1"
}


variable "bucket_name" {
  description = "s3 bucket name"
  default     = "tf-state-bucket-ecs-cicd"
}
