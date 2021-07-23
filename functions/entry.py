import boto3
import logging
import json
import os

client = boto3.client("lambda")

log = logging.getLogger()
log.setLevel(logging.INFO)

BASE_ARN_LAMBDA = "arn:aws:lambda:ap-southeast-1:046111613375:function:"

service_dict = {
    "get_sum": f"{BASE_ARN_LAMBDA}lambda_get_sum_{os.getenv('env')}",
    "get_round": f"{BASE_ARN_LAMBDA}lambda_get_round_{os.getenv('env')}",
    "get_summary": f"{BASE_ARN_LAMBDA}lambda_get_summary_{os.getenv('env')}",
    "get_text_analysis": f"{BASE_ARN_LAMBDA}lambda_get_text_analysis_{os.getenv('env')}",
}

CORS = (
    "*"  # if os.getenv("env") != "prod" else "https://festive-noyce-66178c.netlify.app"
)


def lambda_handler(event, context):

    if event["httpMethod"] == "OPTIONS":
        return {
            "statusCode": 200,
            "headers": {
                "Access-Control-Allow-Headers": "Content-Type",
                "Access-Control-Allow-Origin": CORS,
                "Access-Control-Allow-Methods": "OPTIONS,POST,GET",
            },
        }

    data = []
    services = []

    request_body = (
        json.loads(event.get("body")) if event.get("body") is not None else None
    )

    if request_body is not None:
        data = request_body["data"].get("data", [])
        services = request_body["data"].get("services", {})
        visualization = request_body["data"].get("visualization", {})

    # # retrieve data
    # if not isinstance(data, list):
    #     try:
    #         data = _data_handler(data)
    #     except Exception as e:
    #         raise e

    # apply service
    if services is not None:
        try:
            data = _service_handler(data, services)
            log.error(data)
        except Exception as e:
            log.error(e)
            raise e

    # apply visualization
    if len(visualization.keys()) > 0:
        try:
            parent_element = _visualization_handler(visualization)
            data = str(data[0]) if isinstance(data, list) else str(data)
            data = f"<{ parent_element }>{data}</{ parent_element }>"
        except Exception as e:
            raise e

    return {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Headers": "Content-Type",
            "Access-Control-Allow-Origin": CORS,
            "Access-Control-Allow-Methods": "OPTIONS,POST,GET",
        },
        "body": data,
    }


# def _data_handler(data: dict, inputParams: dict) -> dict:

#     response = client.invoke(
#         FunctionName="arn:aws:lambda:eu-west-1:890277245818:function:DataHandler",
#         InvocationType="RequestResponse",
#         Payload=json.dumps(inputParams),
#     )

#     data = json.load(response["Payload"])
#     return data


def _service_handler(data: list, services: list):
    try:
        services = sorted(services, key=lambda i: i["position"])
    except Exception as e:
        log.error(e)

    for service in services:
        name = service["name"]
        config = service.get("config", {})

        if name in service_dict.keys():

            try:
                payload = {"data": data, "config": config}
                res = client.invoke(
                    FunctionName=service_dict[name],
                    InvocationType="RequestResponse",
                    Payload=json.dumps(payload),
                )
            except Exception as e:
                log.error(e)
                raise e

            data: list = json.loads(res.get("Payload").read())

        else:
            log.error(f"{ name } is not a valid service name.")

    return data


def _visualization_handler(visualization: dict) -> str:

    if "renderType" in visualization and visualization["renderType"] == "basic":
        return visualization.get("mainElement", "span")
