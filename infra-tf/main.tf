

module "s3_static_website" {
  source           = "./s3_static_website"
  website_bucket   = var.website_bucket
  resume_bucket    = var.resume_bucket
  lambda_bucket    = var.lambda_bucket
  resume_key  = var.resume_key
 # resume_bucket_access_role_arn = module.iam_roles.resume_bucket_access_role_arn
  
}
module "dynamodb_table" {
  source = "./dynamodb"
}

module "iam_roles" {
  source              = "./iam_roles"
  dynamodb_table_name = module.dynamodb_table.table_name
  s3_resume_bucket    = module.s3_static_website.resume_bucket
  s3_resume_bucket_arn = module.s3_static_website.s3_resume_bucket_arn
  
}


module "lambda_functions" {
  source              = "./lambda_functions"
  lambda_exec_role_arn = module.iam_roles.lambda_exec_role_arn  
  s3_resume_bucket    = module.s3_static_website.resume_bucket
  dynamodb_table_name = module.dynamodb_table.table_name
}

module "api_gateway" {
  source             = "./api_gateway"
  lambda_download    = module.lambda_functions.download_lambda_arn
  lambda_visitor     = module.lambda_functions.visitor_lambda_arn
  lambda_exec_role_arn = module.iam_roles.lambda_exec_role_arn  
  region             = var.region   # Pass region variable
  account_id         = var.account_id   # Pass account_id variable
}

module "cloudfront" {
  source                = "./cloudfront"
  s3_bucket_arn         = module.s3_static_website.website_bucket_arn
  s3_bucket_domain_name = module.s3_static_website.website_bucket_domain
  default_root_object   = "index.html"
  comment               = "CloudFront distribution for serving static website content"
}

