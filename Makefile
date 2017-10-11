###
#
##

SERVICE = directory-service
CLIENT = employee-client

.PHONY: *

run:
	cd $(PWD)/$(SERVICE) && make bootRun & cd $(PWD)/$(CLIENT) && make bootRun && fg
# run

login:
	cf login -a api.run.pivotal.io
# login

deploy:
#	@make service
#	@make client
	cf set-env $(CLIENT)-mrc DIRECTORY_URL "$$(cd $(PWD)/$(SERVICE) && make url)"
	cf set-env $(CLIENT)-mrc COMPANY_ID "$$(cd $(PWD)/$(SERVICE) && make id)"
# deploy

service:
	cd $(SERVICE) && make deploy
# service

client:
	cd $(CLIENT) && make deploy
# client


# Makefile
