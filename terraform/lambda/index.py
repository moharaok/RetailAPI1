import json
import os
from decimal import Decimal

import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def handler(event, context):
    method = event.get("httpMethod", "GET")
    path_params = event.get("pathParameters") or {}
    item_id = path_params.get("id")

    if method == "GET" and item_id:
        response = table.get_item(Key={"id": item_id})
        item = response.get("Item")
        if not item:
            return _respond(404, {"error": "not found"})
        return _respond(200, item)

    if method == "POST":
        body = json.loads(event.get("body") or "{}", parse_float=Decimal)
        if "id" not in body:
            return _respond(400, {"error": "id required"})
        table.put_item(Item=body)
        return _respond(201, body)

    return _respond(400, {"error": "unsupported operation"})


def _respond(status, body):
    return {
        "statusCode": status,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body, default=str),
    }
