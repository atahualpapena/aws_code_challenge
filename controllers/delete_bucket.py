import json
import boto3

s3 = boto3.client('s3')


def lambda_handler(event, context):
    response = s3.delete_bucket(
        Bucket=event['body']['bucket']
    )
