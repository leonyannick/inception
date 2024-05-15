all: volumes up

clean: down
	docker system prune -af

re: clean up

volumes:
	mkdir -p /home/lbaumann/data/wordpress
	mkdir -p /home/lbaumann/data/mariadb

clean_volumes:
	rm -rf /home/lbaumann/data/wordpress
	rm -rf /home/lbaumann/data/mariadb

up:
	docker compose -f ./srcs/compose.yaml up --build

down:
	docker compose -f ./srcs/compose.yaml