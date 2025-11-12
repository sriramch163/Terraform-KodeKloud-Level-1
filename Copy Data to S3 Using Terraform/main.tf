resource "aws_s3_bucket" "my_bucket" {
  bucket = "nautilus-cp-6289"
  acl    = "private"

  tags = {
    Name        = "nautilus-cp-6289"
  }
}


resource "aws_s3_object" "nautilus_file" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key = "nautilus.txt"
  source = "/tmp/nautilus.txt"
  acl = "private"
}