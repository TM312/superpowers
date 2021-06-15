# Service README



## Dir Structure

- Each service contains the following




## Endpoints

| Endpoint         | Name           | Auth          | Description       |
| :--------------- |:---------------| :--------------- |:---------------|
| /      | Main | True | Returns the result of the functions |
| /help      | Help | False | Provides i) general information about how to use the main endpoint and ii) specific details. |
| /sample      | Sample | False | Returns sample data for each   |
| /statistics      | Statistics | False | Returns statistics for each service.|


## Sample Configuration

```py
{
    'data': [1,2,3,4],
    'services': [
        {
            'position':1,
            'name': 'get_sum',
        },
        {
            'position':2,
            'name': 'get_rounded',
        }
    ],
    'visualization': None
}
```
