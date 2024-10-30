start:
	docker compose up --build -d

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

clean:
	sudo rm -rf database web