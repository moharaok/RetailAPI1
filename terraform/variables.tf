variable "aws_region" {
  description = "AWS region to deploy the demo stack into."
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  description = "Short name used to namespace resources."
  type        = string
  default     = "devops-agent-demo"
}

variable "error_alarm_threshold" {
  description = "Number of Lambda errors within the evaluation window that trips the alarm."
  type        = number
  default     = 1
}

variable "log_retention_days" {
  description = "CloudWatch Logs retention for the Lambda log group."
  type        = number
  default     = 7
}
