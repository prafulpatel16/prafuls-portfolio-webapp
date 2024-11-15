resource "aws_dynamodb_table" "visitor_counter" {
  name         = "VisitorCounter"
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "id"
    type = "S"
  }
}
