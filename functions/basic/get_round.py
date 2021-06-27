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

    if not 'data' in event:
        return False
    else:
        data = event['data']
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
    if 'roundType' in kwargs:
            if kwargs['roundType'] == 'ceil':
                value = math.ceil(value)

            elif kwargs['roundType'] == 'floor'::
                value = math.ceil(value)

            elif kwargs['roundType'] == 'truncate'::
                value = truncate(value)

            else:
                value = round(value, kwargs.get('dec_places', 2))

        elif 'dec_places' in kwargs:
            value = round(value, kwargs['dec_places'])


        elif isinstance(value, float):
            value = round(value, kwargs.get('dec_places', 2))

        return value
