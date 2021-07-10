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
