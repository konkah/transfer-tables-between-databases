.PHONY: build start finish app-print-logs api-bash test-api

include env/dev.env

build:
	@docker build -t konkah/$(DOCKER_TAG) -f containers/$(DOCKER_FILE).Dockerfile .

start:
	@docker compose -f containers/dev.docker-compose.yml up -d

app-print-logs:
	@docker logs $(DOCKER_APP_NAME)

app-bash:
	@docker exec -it  $(DOCKER_APP_NAME) bash

finish:
	@echo ">>>>> Remove $(DOCKER_FOLDER_NAME)"
	@docker compose -f containers/dev.docker-compose.yml down --rmi local --remove-orphans
