from typing import Union
import logging
import math

log = logging.getLogger(__name__)

def get_sum(**kwargs: list) -> Union[int, float]:
    """
    gets sum of list of values

    kwargs
    - data: list of floats or integers to be summed

    """
    if not 'data' in kwargs:
        return False
    else:
        data = kwargs['data']

    if not isinstance(data, list):
        return False

    try:
        total = sum(data)
        return total

    except Exception as e:
        log.error(e)
        raise e
