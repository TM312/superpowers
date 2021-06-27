from typing import Union
import logging
import json

log = logging.getLogger()
log.setLevel(logging.INFO)


def lambda_handler(event, context) -> Union[int, float]:
    """
    gets sum of list of values

    event
    - data: list of floats or integers to be summed

    """

    if not "data" in event:
        log.error("Data missing")
        return False

    else:
        data = event["data"]

    if not isinstance(data, list):
        log.error("data", json.dumps(data))
        return False

    try:
        total = sum(data)
        return total

    except Exception as e:
        log.error(e)
        raise e
