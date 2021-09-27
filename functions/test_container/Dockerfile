# python3.8 lambda base image
FROM public.ecr.aws/lambda/python:3.8

# copy requirements.txt to container
COPY requirements.txt .

# installing dependencies
RUN pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Copy function code to container
COPY app.py ${LAMBDA_TASK_ROOT}

# setting the CMD to your handler file_name.function_name
CMD [ "app.lambda_handler" ]
