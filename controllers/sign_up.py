import boto3
import json


# takes event from api gateway and inserts it into dynamodb
def lambda_handler(event, context):
    client = boto3.client('dynamodb')
    table = boto3.resource('dynamodb').Table('users')
    response = table.put_item(Item=event)
