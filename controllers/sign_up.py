import boto3
import json
client = boto3.client('cognito-idp')
headers = {
    "Access-Control-Allow-Headers": "*",
    "Access-Control-Allow-Methods": "POST, PUT, DELETE, GET",
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
    "X-Requested-With": "*"
}


def lambda_handler(event, context):
    response = client.sign_up(
        ClientId='203c8v9lfta88mj3mon78h3eaf',
        Username=event["body"]["username"],
        Password=event["body"]["password"],
        UserAttributes=[
            {
                'Name': 'email',
                'Value': event["body"]["email"]
            },
        ]
    )
    client.admin_confirm_sign_up(
        UserPoolId='us-west-2_A4hptIkbF',
        Username=event["body"]["username"]
    )
    return response
