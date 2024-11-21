import json
import boto3
import base64
import os
from botocore.exceptions import ClientError

s3 = boto3.client('s3')

def lambda_handler(event, context):
    bucket_name = os.getenv('S3_BUCKET_NAME')
    resume_key = os.getenv('RESUME_KEY')

    try:
        # Fetch the resume PDF from S3
        response = s3.get_object(Bucket=bucket_name, Key=resume_key)
        pdf_content = response['Body'].read()

        # Return the PDF file as binary stream
        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/pdf',
                'Content-Disposition': 'attachment; filename="sample_resume.pdf"',
            },
            'body': base64.b64encode(pdf_content).decode('utf-8'),
            'isBase64Encoded': True  # This must be True for binary files
        }

    except ClientError as e:
        error_code = e.response['Error']['Code']
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error downloading resume: {error_code} - {str(e)}")
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error downloading resume: {str(e)}")
        }
