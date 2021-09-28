ENV=dev

# to store config for different environments
tf-create-workspace:
	cd terraform && \
	terraform workspace new $(ENV)


tf-init:
	cd terraform && \
	terraform workspace select $(ENV) && \
	terraform init

#ACTION default value is plan --> can also run apply, destroy
x?=plan
tfx:
	cd terraform && \
	terraform workspace select $(ENV) && \
	terraform ${x} \
	-var-file="./environments/common.tfvars" \
	-var-file="./environments/${ENV}/config.tfvars"

# # use if layer deps have changed
# RESOURCE?=module.lambda_layers.aws_lambda_layer_version.nlp_layer
# tf-rmr:
# 	cd terraform && \
# 	terraform workspace select $(ENV) && \
# 	terraform state rm ${RESOURCE}

tf-list:
	cd terraform && \
	terraform workspace select $(ENV) && \
	terraform state list

# #WD default value is plan --> can also run apply, destroy
# NAME?=nlp
# VERSION?=3.8
# tf-layer:
# 	cd terraform/modules/lambda-layers && \
# 	docker run -v "${PWD}/terraform/modules/lambda-layers":/var/task "lambci/lambda:build-python${VERSION}" /bin/sh -c "pip install --no-deps -r ${PWD}/terraform/modules/lambda-layers/requirements_${NAME}.txt -t ${NAME}/python/lib/python3.8/site-packages/; exit"
