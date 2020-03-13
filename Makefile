# PHONY targets are not associated with files
.PHONY: help run build deploy initialize-dbs provision-infra

# the default target is the first target
help:
	@echo 'Makefile for a static blog site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make help                      print this message                      '
	@echo '   make run                       start the application locally           '
	@echo '   make build                     build the docker images                 '
	@echo '   make deploy                    pushes the images and deploy            '
	@echo '   make provision-infra           create the required infra for deployment'
	@echo '                                                                          '

run: build
	@echo 'starting applications'
	docker-compose up -d
	@echo 'TBD'

build:
	docker-compose -f docker-compose.base.yaml build
	docker-compose -f docker-compose.yaml build

deploy: build
	@echo 'TBD'

initialize-dbs:
	@bash ./bin/initialize_dbs.sh

provision-infra:
	@echo 'TBD'
