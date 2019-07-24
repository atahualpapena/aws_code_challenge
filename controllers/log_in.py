import json
import boto3


# queries dynamodb for username and password
def lambda_handler(event, context):
    client = boto3.client('dynamodb')
    table = boto3.resource('dynamodb').Table('users')
    response = table.scan()
    print(response['Items'])
