output "api_base_url" {
  description = "Base URL for the REST API."
  value       = "https://${aws_api_gateway_rest_api.this.id}.execute-api.${var.aws_region}.amazonaws.com/${aws_api_gateway_stage.prod.stage_name}"
}

output "example_get_url" {
  description = "Example GET URL (will 404 until you POST an item with id=123)."
  value       = "https://${aws_api_gateway_rest_api.this.id}.execute-api.${var.aws_region}.amazonaws.com/${aws_api_gateway_stage.prod.stage_name}/items/123"
}

output "items_table_name" {
  description = "DynamoDB table name."
  value       = aws_dynamodb_table.items.name
}

output "lambda_function_name" {
  description = "Lambda function name - use this when injecting the demo bug."
  value       = aws_lambda_function.api.function_name
}

output "alarm_name" {
  description = "CloudWatch alarm that trips when the bug fires."
  value       = aws_cloudwatch_metric_alarm.lambda_errors.alarm_name
}
