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
ACTION?=plan
tfx:
	cd terraform && \
	terraform workspace select $(ENV) && \
	terraform ${ACTION} \
	-var-file="./environments/common.tfvars" \
	-var-file="./environments/${ENV}/config.tfvars"
