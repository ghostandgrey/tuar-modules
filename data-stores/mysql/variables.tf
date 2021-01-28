variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type = string
}

variable "secret_id" {
  description = "The ID for the secret to access from AWS Secrets Manager"
  type = string
}

variable "database_name" {
  description = "The name of the dynamo DB"
  type = string
}