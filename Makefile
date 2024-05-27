all: volumes up

clean: down
	docker system prune -af

re: clean up

volumes:
	sudo mkdir -p /home/lbaumann/data/wordpress
	sudo mkdir -p /home/lbaumann/data/mariadb

clean_volumes:
	sudo rm -rf /home/lbaumann/data/wordpress
	sudo rm -rf /home/lbaumann/data/mariadb

up:
	docker compose -f ./srcs/compose.yaml up --build

down:
	docker compose -f ./srcs/compose.yaml