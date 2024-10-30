start:
	docker compose up --build -d

stop:
	docker compose down 

enter_mariadb:
	docker compose exec mariadb /bin/bash

enter_wordpress:
	docker compose exec enter_wordpress /bin/sh

enter_nginx:
	docker compose exec enter_ngnx /bin/bash

build_nginx:
	docker compose up --force-recreate --build -d nginx

build_wordpress:
	docker compose up --force-recreate --build -d  wordpress

build_mariadb:
	docker compose up --force-recreate --build -d mariadb
logs:
	docker compose logs