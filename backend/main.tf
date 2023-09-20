# Bucket used to store our state file
resource "aws_s3_bucket" "state_file" {
  bucket = "terraform-lock-state-20092023"
}

# Enabling bucket versioning to keep backup copies of the state file
resource "aws_s3_bucket_versioning" "state_file" {
  bucket = aws_s3_bucket.state_file.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Table used to store the lock to prevent parallel runs causing issues
resource "aws_dynamodb_table" "state_file_lock" {
  name           = "terraform-lock-state-20092023"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}