include .env

SERVICE_NAME=centro_medico_mysql
HOST=127.0.0.1
PORT=3309

PASSWORD=${MYSQL_ROOT_PASSWORD}
DATABASE=${MYSQL_DATABASE}
USER=${MYSQL_USER}

DOCKER_COMPOSE_FILE=./docker-compose.yml
DATABASE_CREATION=./script_sql/esquema.sql
DATABASE_POPULATION=./script_sql/population.sql

FILES=procedimientos triggers vistas funciones 


.PHONY: all up objects test-db access-db down


all: info up objects


info:
	@echo "Este proyecto es sobre un  '$(DATABASE)'."


up:
	@echo "Creando instancia de docker ..."
	docker compose -f ${DOCKER_COMPOSE_FILE} up -d --build

	@echo "Esperando que MySQL este disponible ..."
	@echo "Ejecutando mysql_wait.sh ..."
	bash mysql_wait.sh

	@echo "Importamos y ejecutamos el script ..."
	docker exec -it ${SERVICE_NAME} mysql -u${USER} -p${PASSWORD} -e "source ${DATABASE_CREATION};"
	docker exec -it $(SERVICE_NAME) mysql -u$(USER) -p$(PASSWORD) --local-infile=1 -e "source $(DATABASE_POPULATION);"


objects:
		@echo "Creando objetos en 'centro_medico' ..."
		@for file in ${FILES}; do \
			@echo "Procesando $$file y añadiendo a la base de datos: ${DATABASE}"; \
		docker exec -it ${SERVICE_NAME} mysql -u$(MYSQL_USER) -p$(PASSWORD) -e "source ./script_sql/object_DB/$$file.sql"; \
		done
