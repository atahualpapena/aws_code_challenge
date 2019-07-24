import json
import boto3

client = boto3.client('cognito-idp')


def lambda_handler(event, context):
    response = client.initiate_auth(
        AuthFlow='USER_PASSWORD_AUTH',
        AuthParameters={
            'USERNAME': event["body"]["username"],
            'PASSWORD': event["body"]["password"]
        },
        ClientId='203c8v9lfta88mj3mon78h3eaf'
    )
    return response
