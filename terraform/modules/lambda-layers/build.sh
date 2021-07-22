#!/bin/bash
docker run -v "${PWD}":/var/task "lambci/lambda:build-python3.8" /bin/sh -c "pip install --no-deps -r requirements_$1.txt -t $1/python/lib/python3.8/site-packages/; exit"
