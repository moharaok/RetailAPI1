# DevOps Agent 90-Second Demo — Terraform

Infrastructure for the 90-second demo: API Gateway → Lambda (Python 3.12) → DynamoDB,
plus a CloudWatch alarm on Lambda errors that you wire to the AWS DevOps Agent.

## Layout

```
terraform/
├── versions.tf        # provider + terraform version pins
├── variables.tf       # inputs (region, app_name, thresholds)
├── dynamodb.tf        # items table
├── iam.tf             # Lambda execution role + scoped DDB policy
├── lambda.tf          # Lambda function + log group + zip packaging
├── apigateway.tf      # REST API, resources, methods, stage
├── cloudwatch.tf      # error alarm
├── outputs.tf         # API URL, function name, alarm name
└── lambda/
    └── index.py       # handler source (edit this to inject the demo bug)
```

## Deploy

```bash
cd terraform
terraform init
terraform apply
```

Override defaults inline or with a `.tfvars` file:

```bash
terraform apply -var="aws_region=us-west-2" -var="app_name=my-demo"
```

## Exercise the API

```bash
API=$(terraform output -raw api_base_url)

curl -s -X POST "$API/items" \
  -H 'Content-Type: application/json' \
  -d '{"id":"123","name":"widget"}'

curl -s "$API/items/123"
```

## Demo bug injection

Edit `lambda/index.py` and re-run `terraform apply` to roll the new code.
Suggested bugs that make a clean PR diff:

- Typo the key: `Key={"ID": item_id}` instead of `Key={"id": item_id}` → `ValidationException`.
- Drop the `default=str` from `json.dumps` and have the handler return a `Decimal` → `TypeError`.
- Index into a missing field without a guard: `item["price"] * 2` → `KeyError`.

Hit `GET /items/123` after deploying — the `*-lambda-errors` alarm fires within ~60s.
