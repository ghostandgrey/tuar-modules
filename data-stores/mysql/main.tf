terraform {
  backend "s3" {
    bucket = var.db_remote_state_bucket
    key = var.db_remote_state_key
    region = "us-east-2"
    dynamodb_table = "altocorp-terraform-locks"
    encrypt = true
  }
}
provider "aws" {
  region = "us-east-2"
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = var.secret_id
}

resource "aws_db_instance" "example_db" {
  identifier_prefix = "altocorp"
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = var.database_name
  username = "admin"

  password = jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string).dbpassword
}