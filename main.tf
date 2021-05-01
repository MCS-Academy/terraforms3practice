resource "aws_s3_bucket" "mcsbucket" {
   bucket   = "mycloudseriesbucket"
   acl      = "public-read"
}
