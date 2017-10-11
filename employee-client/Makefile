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
	curl -s http://$(NAME)-mrc.cfapps.io/employees
# deploy

# Makefile
