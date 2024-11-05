start:
	docker compose -f srcs/docker-compose.yml up --build -d


re: clean create_dirs start

stop:
	docker compose -f srcs/docker-compose.yml down -v

enter_mariadb:
	docker compose exec mariadb /bin/bash /srcs/docker-compose.yml

enter_wordpress:
	docker compose exec wordpress /bin/sh /srcs/docker-compose.yml

enter_nginx:
	docker compose exec nginx /bin/bash /srcs/docker-compose.yml

build_nginx:
	docker compose up --force-recreate --build -d nginx /srcs/docker-compose.yml

build_wordpress:
	docker compose up --force-recreate --build -d  wordpress /srcs/docker-compose.yml

build_mariadb:
	docker compose up --force-recreate --build -d mariadb /srcs/docker-compose.yml
logs:
	docker compose -f srcs/docker-compose.yml logs

create_dirs:
	@echo "Creating necessary directories..."
	@mkdir -p /home/dliuzzo/data/wordpress
	@mkdir -p /home/dliuzzo/data/mariadb
	@echo "Directories created."

clean:
	@echo "Cleaning up volume stored at /home/dliuzzo/data..."
	@-docker rmi $$(docker images -q) 2>/dev/null
	docker image prune -f
	docker container prune -f
	docker volume prune -f
	docker network prune -f
	docker system prune -f --volumes
	sudo rm -rf $(data)
	@sudo rm -rf /home/dliuzzo/data/*
	@echo "Cleanup completed."
