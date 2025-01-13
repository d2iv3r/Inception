.PHONY: build

all : build

build:
	mkdir -p /home/efarhat/data/wordpress /home/efarhat/data/db
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes
