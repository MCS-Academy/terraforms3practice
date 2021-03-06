locals {
  workspace = "development"
}
resource "aws_s3_bucket" "mcsbucket" {
   #bucket   = "ewere-storage-service-upss"
   #bucket   = var.s3_bucket_name
   bucket    = lookup(var.s3_bucket_name, local.workspace)
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "MyCloudSeriesGameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }

  #ttl {
  #  attribute_name = "TimeToExist"
  #  enabled        = false
  #}

  global_secondary_index {
    name               = "GameTitleIndex"
    hash_key           = "GameTitle"
    range_key          = "TopScore"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
