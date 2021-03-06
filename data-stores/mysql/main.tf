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
  final_snapshot_identifier = "bugged"

  password = jsondecode(data.aws_secretsmanager_secret_version.db_password.secret_string).dbpassword
}