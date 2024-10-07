import json
import boto3
from decimal import Decimal

# Initialize DynamoDB resource
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('VisitorCountTable')

# Helper function to convert Decimal to int or float
def decimal_default(obj):
    if isinstance(obj, Decimal):
        return int(obj) if obj % 1 == 0 else float(obj)
    raise TypeError

def lambda_handler(event, context):
    try:
        # Define the primary key (static 'id' for counting visitors)
        visitor_id = "visitorCount"

        # Update the visitor count in DynamoDB
        response = table.update_item(
            Key={'id': visitor_id},
            UpdateExpression="SET visits = if_not_exists(visits, :start) + :increment",
            ExpressionAttributeValues={
                ':start': 0,
                ':increment': 1
            },
            ReturnValues="UPDATED_NEW"
        )

        # Get the updated visitor count
        updated_visits = response['Attributes']['visits']

        # Return response with CORS headers
        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*',  # Allow any origin
                'Access-Control-Allow-Methods': 'GET',  # Allow GET method
                'Access-Control-Allow-Headers': 'Content-Type',  # Allow Content-Type header
            },
            'body': json.dumps({'visits': updated_visits}, default=decimal_default)
        }

    except Exception as e:
        print(f"Error updating visitor count: {str(e)}")
        return {
            'statusCode': 500,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET',
                'Access-Control-Allow-Headers': 'Content-Type',
            },
            'body': json.dumps({'message': f'Error: {str(e)}'})
        }
