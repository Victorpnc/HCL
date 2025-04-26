resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = var.dynamo_table_name
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  billing_mode = "PROVISIONED"
}

Variables (modules/s3-dynamodb-backend/variables.tf)

variable "s3_bucket_name" {}
variable "dynamo_table_name" {}
