import boto3
import logging
import json
import os

lambda_client = boto3.client("lambda")

log = logging.getLogger()
log.setLevel(logging.INFO)

BASE_ARN_LAMBDA = "arn:aws:lambda:ap-southeast-1:046111613375:function:"

SERVICES = [
    "get_sum",
    "get_round",
    "get_summary",
    "get_text_analysis",
    "container_test",
]

service_dict = {
    service: f"{BASE_ARN_LAMBDA}lambda_{service}_{os.getenv('env')}"
    for service in SERVICES
}

CORS = "*"
# (
#     "*"  # if os.getenv("env") != "prod" else "https://festive-noyce-66178c.netlify.app"
# )


def lambda_handler(event, context):

    if event["httpMethod"] == "OPTIONS":
        return _response_handler()

    elif event["httpMethod"] == "POST":
        body_field = event.get("body")
        if not isinstance(body_field, dict):
            try:
                request_body = json.loads(body_field)
            except Exception as e:
                # !!! TODO: Exception handler method
                return _response_handler(message=str(e), status_code=500)

            if request_body is None:
                # !!! TODO: Exception handler method
                return _response_handler(message="empty")

        else:
            # !!! TODO: Exception handler method
            return _response_handler(message="reject")

    else:
        # !!! TODO: Exception handler method
        return _response_handler(message="reject")

    data = request_body.get("data", [])
    services = request_body.get("services", [])

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
            log.error("data in services: %r", data)
        except Exception as e:
            log.error(e)
            raise e

    return _response_handler(body=json.dumps(data))


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
                res = lambda_client.invoke(
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


def _response_handler(
    message: str = None, body: str = None, status_code: int = 200
) -> dict:
    response_dict = {
        "statusCode": status_code,
        "headers": {
            "Access-Control-Allow-Headers": "Content-Type",
            "Access-Control-Allow-Origin": CORS,
            "Access-Control-Allow-Methods": "OPTIONS,POST",
        },
        "message": message,
        "body": body,
    }
    response_dict = {k: v for k, v in response_dict.items() if v is not None}

    return response_dict


# def _data_handler(data: dict, inputParams: dict) -> dict:

#     response = lambda_client.invoke(
#         FunctionName="arn:aws:lambda:eu-west-1:890277245818:function:DataHandler",
#         InvocationType="RequestResponse",
#         Payload=json.dumps(inputParams),
#     )

#     data = json.load(response["Payload"])
#     return data
