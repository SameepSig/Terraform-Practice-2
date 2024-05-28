resource "aws_s3_bucket" "sameep_static_website_s3_bucket" {
  bucket = "sameep-s3-static-website-bucket" #Should be globally unique
  # force_destroy = true

  tags = {
  Name        = "sameep_s3_bucket"
  owner = "sameep.sigdel"
  environment = "dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "sameep_s3_ownership_controls" {
  bucket = aws_s3_bucket.sameep_static_website_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "sameep_aws_s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.sameep_static_website_s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "sameep_aws_s3_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.sameep_s3_ownership_controls,
    aws_s3_bucket_public_access_block.sameep_aws_s3_bucket_public_access_block
  ]

  bucket = aws_s3_bucket.sameep_static_website_s3_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "sameep_hosting_aws_s3_bucket_policy" {
  bucket = aws_s3_bucket.sameep_static_website_s3_bucket.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" = "Allow",
        "Principal" = "*",
        "Action" = "s3:GetObject",
        "Resource" = "${aws_s3_bucket.sameep_static_website_s3_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "sameep_hosting_bucket_website_configuration" {
  bucket = aws_s3_bucket.sameep_static_website_s3_bucket.id
  
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "sameep_hosting_bucket_files" {
  bucket = aws_s3_bucket.sameep_static_website_s3_bucket.id

  for_each = var.template_files

  key = each.key
  content_type = each.value.content_type

  source = each.value.source_path
  content = each.value.content

  etag = each.value.digests.md5  
}