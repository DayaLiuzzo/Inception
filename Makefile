start:
	docker compose up --build -d


re: clean create_dirs start

stop:
	docker compose down -v

enter_mariadb:
	docker compose exec mariadb mysql -u root -p

enter_wordpress:
	docker compose exec wordpress /bin/sh

enter_nginx:
	docker compose exec nginx /bin/bash

build_nginx:
	docker compose up --force-recreate --build -d nginx

build_wordpress:
	docker compose up --force-recreate --build -d  wordpress

build_mariadb:
	docker compose up --force-recreate --build -d mariadb
logs:
	docker compose logs

create_dirs:
	@echo "Creating necessary directories..."
	@mkdir -p /home/dliuzzo/data/wordpress
	@mkdir -p /home/dliuzzo/data/mariadb
	@echo "Directories created."

clean:
	@echo "Cleaning up volume stored at /home/dliuzzo/data..."
	@sudo rm -rf /home/dliuzzo/data/*
	@echo "Cleanup completed."