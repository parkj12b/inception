# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: minsepar <minsepar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/10 17:22:41 by minsepar          #+#    #+#              #
#    Updated: 2024/10/11 15:42:00 by minsepar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

up: ## Start services in the background
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up

down: ## Stop and remove all containers, networks, and volumes
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

build: ## Build or rebuild services
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

logs: ## View output from containers
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

restart: ## Restart all services
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) restart

ps: ## List containers
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) ps

clean:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down --rmi all -v --remove-orphans

fclean: clean
	docker system prune -a --volumes
	rm -rf /home/minsepar/data/db_data/*
	rm -rf /home/minsepar/data/wp_data/*

.PHONY: up down build restart ps 