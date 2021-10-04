import logging
import boto3

log = logging.getLogger()
log.setLevel(logging.INFO)


def lambda_handler(event, context) -> bytes:
    """
    rounds value

    event
    - bucket_name: str
    – key: str
    - (optional) credentials: {
        AWS_ACCESS_KEY_ID: str
        AWS_SECRET_ACCESS_KEY: str
        AWS_DEFAULT_REGION: str
    }

    """

    bucket_name = event["bucket_name"]
    key = event["key"]
    credentials = event.get("credentials")

    if not isinstance(bucket_name, str):
        return False

    if not isinstance(key, str):
        return False

    if isinstance(credentials, dict):
        try:
            AWS_ACCESS_KEY_ID = credentials["AWS_ACCESS_KEY_ID"]
            AWS_SECRET_ACCESS_KEY = credentials["AWS_SECRET_ACCESS_KEY"]
            AWS_DEFAULT_REGION = credentials["AWS_DEFAULT_REGION"]

        except Exception as e:
            raise e

    else:
        try:
            # TODO: Setup token
            credentials = _get_user_aws_cred("token")

        except Exception as e:
            raise e

    s3_client = boto3.client(
        "s3",
        aws_access_key_id=AWS_ACCESS_KEY_ID,
        aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
        region_name=AWS_DEFAULT_REGION,
    )

    res = s3_client.get_object(Bucket=bucket_name, Key=key)

    # TODO: Handling depending on file type?
    # import json

    # below too
    # data = json.loads(res["Body"].read().decode("utf-8"))


def _get_user_aws_cred(token: str):
    pass
