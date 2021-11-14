import shortuuid


def lambda_handler(event, context):

    # TODO implementation
    _id = shortuuid.uuid()

    return f"Lambda Container image invoked with id: {_id}!"
