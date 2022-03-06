
resource "aws_s3_bucket" "records" {
  bucket = "remote-cam-records-dev"
  //削除する時のみ以下のコメントを外してapplyする
  force_destroy = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "records" {
  bucket = aws_s3_bucket.records.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "records" {
  bucket = aws_s3_bucket.records.id
  rule {
    id     = "delete records after 1 day"
    status = "Enabled"
    expiration {
      days = "1"
    }
  }
}