up:
	@docker-compose up -d
	@docker-compose ps

up-build:
	@docker-compose up -d --build
	@docker-compose ps

ps:
	@docker-compose ps

logs:
	@docker-compose logs

app:
	@docker-compose exec app zsh

SHELL := /bin/bash

tests:
	symfony console doctrine:database:drop --force --env=test || true
	symfony console doctrine:database:create --env=test
	symfony console doctrine:migrations:migrate -n --env=test
	symfony console doctrine:fixtures:load -n --env=test
	symfony php bin/phpunit $@
.PHONY: tests