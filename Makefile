include .env

SERVICE_NAME=mysql
HOST=127.0.0.1
PORT=3309

PASSWORD=${MYSQL_ROOT_PASSWORD}
DATABASE=${MYSQL_DATABASE}
USER=${MYSQL_USER}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./script_sql/esquema.sql
DATABASE_POPULATION=./script_sql/population.sql
DATABASE_PROCEDURES=./script_sql/objetos_DB/procedimientos.sql
DATABASE_TRIGGERS=./script_sql/objetos_DB/triggers.sql
DATABASE_VIEWS=./script_sql/objetos_DB/vistas.sql
DATABASE_FUNCTIONS=./script_sql/objetos_DB/funciones.sql


.PHONY: all up objects test-db access-db down


all: info up objects


info:
	@echo "This is a project for $(DATABASE)"