# S U P E R P O W E R S

## PoC for running a lightweight page with all the intensive stuff on remote


What is an API, really?


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



## Next Steps
[] create tf config for get_sum and get_rounded


## PoC Example Ideas
- basic arithmetic
- text tokenization using spacy
- image classification using yolo
    - provide link to image
    - pipeline:
        - extract image
        - classify image
