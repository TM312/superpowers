import boto3
import logging
import json
import os

client = boto3.client("lambda")

log = logging.getLogger()
log.setLevel(logging.INFO)

service_dict = {
    "get_sum": f"arn:aws:lambda:ap-southeast-1:046111613375:function:lambda_get_sum_{os.getenv('env')}",
    "get_round": f"arn:aws:lambda:ap-southeast-1:046111613375:function:lambda_get_round_{os.getenv('env')}",
}


def lambda_handler(event, context):

    data = event.get("data")
    service_list = event.get("services")
    # visualization = event.get("visualization")

    # retrieve data
    if not isinstance(data, list):
        try:
            data = _data_handler(data)
        except Exception as e:
            raise e

    # apply service
    if service_list is not None:
        try:
            data = _service_handler(data, service_list)
            log.error(data)
        except Exception as e:
            log.error(e)
            raise e

    return {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Headers": "Content-Type",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "OPTIONS,POST,GET",
        },
        "body": "\nHello from Lambda!",
    }

    # # apply visualization
    #  if visualization is not None:
    #     try:
    #         data_formatted = _visualization_handler(data, visualization)
    #     except Exception as e:
    #         raise e


def _data_handler(data: dict, inputParams: dict) -> dict:

    response = client.invoke(
        FunctionName="arn:aws:lambda:eu-west-1:890277245818:function:DataHandler",
        InvocationType="RequestResponse",
        Payload=json.dumps(inputParams),
    )

    data = json.load(response["Payload"])
    return data


def _service_handler(data_list: list, service_list: list):
    log.error("in _service_handler")

    service_list = sorted(service_list, key=lambda i: i["position"])
    for service in service_list:
        if service.get("name") in service_dict.keys():
            res = client.invoke(
                FunctionName=service_dict[service["name"]],
                InvocationType="RequestResponse",
                Payload=data_list,
            )

            data_list = json.load(res["Payload"])

            return data_list

        else:
            log.error(f"{ service['name']} is not a valid service name.")
            raise


#

# # visualization_dict = {
# #     'get_sum': get_sum,
# #     'get_round': get_round,
# # }

# # def _visualization_handler(data, visualization):

# #     params = event['data']

# #     if params.get('name') in service_dict.keys():
# #         name = params.get('name')
# #         return service_dict[name](kwargs=params)

# #     else: !!!
# #         raise NotFound
