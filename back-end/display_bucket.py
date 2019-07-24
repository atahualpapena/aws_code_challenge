import json
import boto3


s3 = boto3.client('s3')


def lambda_handler(event, context):
    response = s3.list_buckets()
    list = response['Buckets'][0]['Name']
    buckets = json.dumps(list)
    return buckets
