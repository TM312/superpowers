from typing import Union
import logging
import math

log = logging.getLogger()
log.setLevel(logging.INFO)


def lambda_handler(event, context) -> Union[int, float]:
    """
    rounds value

    event
    - data: data
    – config:
        - decPlaces: integer, default 2, number of digits for rounding
        - roundType: string, indicates rounding type

    """

    data = event["data"]
    config = event["config"]

    if isinstance(data, list):
        try:
            data = [_perform_round(el, config) for el in data]
            return data

        except Exception as e:
            raise e

    elif isinstance(data, (int, float)):
        try:
            data = _perform_round(data, **event)
            return data
        except Exception as e:
            raise e

    else:
        return False


def _perform_round(element: Union[int, float], config):

    if "roundType" in config and config["roundType"] in [
        "ceil",
        "floor",
        "truncate",
        "default",
    ]:
        if config["roundType"] == "ceil":
            value = math.ceil(element)

        elif config["roundType"] == "floor":
            value = math.floor(element)

        elif config["roundType"] == "truncate":
            value = int(element)

        elif config["roundType"] == "default":
            value = element

        else:
            return False

        return round(value, config.get("decPlaces", 2))

    return round(element, config.get("decPlaces", 2))
