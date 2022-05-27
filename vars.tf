variable "s3_bucket_name" {
  default = {
    development = "ewere-storage-service-upss"
    staging     = "ewere-storage-service-qa"
    production  = "ewere-storage-service-upssosa"
  }
}
