variable "s3_bucket_name" {
  type = map(string)
  default = {
    development = "ewere-storage-service-upss"
    staging     = "ewere-storage-service-qa"
    production  = "ewere-storage-service-upssosa"
  }
}
