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
    - dec_places: integer, default 2, number of digits for rounding
    - roundType: string, indicates rounding type

    """

    if not "data" in event:
        log.error("Data missing")
        return False
    else:
        data = event["data"]

    if isinstance(data, list):
        try:
            data = [_perform_round(el, **event) for el in data]
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


def _perform_round(element: Union[int, float], **kwargs):
    if "roundType" in kwargs:
        if kwargs["roundType"] == "ceil":
            value = math.ceil(element)

        elif kwargs["roundType"] == "floor":
            value = math.ceil(element)

        elif kwargs["roundType"] == "truncate":
            value = truncate(element)

        else:
            value = round(element, kwargs.get("dec_places", 2))

    elif "dec_places" in kwargs:
        value = round(element, kwargs["dec_places"])

    elif isinstance(element, float):
        value = round(element, kwargs.get("dec_places", 2))

    return value
