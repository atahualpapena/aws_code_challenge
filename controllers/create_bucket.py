import logging
import boto3
from botocore.exceptions import ClientError

s3 = boto3.client('s3')


def lambda_handler(event, context):

    response = s3.create_bucket(
        Bucket=event['body']['bucket'],
        CreateBucketConfiguration={'LocationConstraint': 'us-west-2'}
    )
