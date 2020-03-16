# PHONY targets are not associated with files
.PHONY: help run build configure deploy logs inset-data initialize-dbs provision-infra

# the default target is the first target
help:
	@echo 'Makefile for a static blog site                                           '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make help                      print this message                      '
	@echo '   make run                       start the application locally           '
	@echo '   make build                     build the docker images                 '
	@echo '   make initialize-dbs            TBD                                     '
	@echo '   make configure                 TBD                                     '
	@echo '   make logs                      TBD                                     '
	@echo '   make inset-data                TBD                                     '
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

initialize-dbs:
	@bash ./bin/initialize_dbs.sh

configure:
	cat config/ksql_config.sql| bin/ksqlcli_pipe.sh
	bash bin/config_kafka_source_db.sh
	bash bin/config_kafka_sink_db.sh
	cat scripts/create_source_tables.sql|bin/ksqlcli_pipe.sh
	cat scripts/show_kafka_resources.sql|bin/ksqlcli_pipe.sh

logs:
	docker-compose logs -f

inset-data:
	@bash -c "PSQL_URL=$(PSQL_1) python scripts/inser_new_rows.py 20"

deploy: build
	@echo 'TBD'

provision-infra:
	@echo 'TBD'
