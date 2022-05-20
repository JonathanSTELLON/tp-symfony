up:
	@docker-compose up -d --build
	@docker-compose ps

ps:
	@docker-compose ps

logs:
	@docker-compose logs

app:
	@docker-compose exec app zsh