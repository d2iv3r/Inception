.PHONY: build

all : build

build:
	mkdir -p your/path/to/volume/wordpress your/path/to/volume/db
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes
