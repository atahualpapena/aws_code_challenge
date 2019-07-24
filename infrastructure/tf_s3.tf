resource "aws_s3_bucket" "bucket" {
  bucket = "ownzonescodechallenge.com"
  acl    = "public-read"
  policy = "${file("s3_policy.json")}"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}