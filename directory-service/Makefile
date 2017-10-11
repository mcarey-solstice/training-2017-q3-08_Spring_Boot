###
#
##

NAME := $(shell basename $(PWD))

.PHONY: *

build:
	./gradlew build
# build

bootRun:
	./gradlew bootRun
# bootRun

deploy:
	./gradlew clean assemble
	cf push $(NAME)-mrc -p build/libs/$(NAME)-*.jar
	curl -s http://$(NAME)-mrc.cfapps.io
	@make backing_service
# deploy

backing_service:
	cf create-service cleardb spark mysql
	cf bind-service $(NAME)-mrc mysql
	cf restage $(NAME)-mrc
# backing_service

url:
	@echo http://$(NAME)-mrc.cfapps.io
# url

id:
	@curl -s http://$(NAME)-mrc.cfapps.io/dbinfo --stderr - | awk -F'\?' '{print $$1}' | awk -F'\/' '{print $$NF}'
# id

# Makefile
