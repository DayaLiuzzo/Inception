# ============================================================
# INCEPTION MAKEFILE
# ============================================================

COMPOSE_FILE	= srcs/docker-compose.yml

# ============================================================

all: start

start:
	docker compose -f $(COMPOSE_FILE) up -d

build:
	docker compose -f $(COMPOSE_FILE) up --build -d

stop:
	docker compose -f $(COMPOSE_FILE) down

re: clean build

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

# ============================================================
# SHELL ACCESS
# ============================================================

enter_mariadb:
	docker exec -it mariadb bash

enter_wordpress:
	docker exec -it wp-php sh

enter_nginx:
	docker exec -it nginx bash

# ============================================================
# CLEANUP
# ============================================================

clean:
	@echo "Stopping containers..."
	@docker compose -f $(COMPOSE_FILE) down --remove-orphans 2>/dev/null || true
	@echo "Removing images..."
	@docker rmi $$(docker images -q) 2>/dev/null || true
	@docker image prune -f
	@docker container prune -f
	@docker volume prune -f
	@docker network prune -f
	@docker system prune -f --volumes
	@sudo rm -rf /home/dliuzzo/data/*
	@echo "Cleanup completed."

.PHONY: all start build stop re logs enter_mariadb enter_wordpress enter_nginx clean