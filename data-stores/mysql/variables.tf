variable "secret_id" {
  description = "The ID for the secret to access from AWS Secrets Manager"
  type = string
}

variable "database_name" {
  description = "The name of the dynamo DB"
  type = string
}