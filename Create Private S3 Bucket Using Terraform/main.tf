resource "aws_s3_bucket" "datacenter_bkt" {
  bucket = "datacenter-s3-15464"
}

resource "aws_s3_bucket_ownership_controls" "datacenter" {
  bucket = aws_s3_bucket.datacenter_bkt.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "datacenter_bkt_private" {
  depends_on = [aws_s3_bucket_ownership_controls.datacenter]

  bucket = aws_s3_bucket.datacenter_bkt.id
  acl    = "private"
}