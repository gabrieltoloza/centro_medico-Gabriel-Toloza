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
USERS_DB_CONTROL=./script_sql/usuarios.sql



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
		docker exec -it ${SERVICE_NAME} mysql -u${USER} -p${PASSWORD} ${DATABASE} -e "source /script_sql/objetos_DB/procedimientos.sql"
		docker exec -it ${SERVICE_NAME} mysql -u${USER} -p${PASSWORD} ${DATABASE} -e "source /script_sql/objetos_DB/triggers.sql"
		docker exec -it ${SERVICE_NAME} mysql -u${USER} -p${PASSWORD} ${DATABASE} -e "source /script_sql/objetos_DB/vistas.sql"
		docker exec -it ${SERVICE_NAME} mysql -u${USER} -p${PASSWORD} ${DATABASE} -e "source /script_sql/objetos_DB/funciones.sql"


test-db:
		@echo "Testing the tables"
		docker exec -it $(SERVICE_NAME)  mysql -u$(USER) -p$(PASSWORD)  -e "source ./script_sql/consultas.sql";


access-db:
		@echo "Accediendo a la base de datos ..."
		docker exec -it ${SERVICE_NAME} mysql -u${USER} -p${PASSWORD} ${DATABASE}


create-users:
		@echo "Creando usuarios y sus permisos ..."
		docker exec -it ${SERVICE_NAME} mysql -uroot -p${PASSWORD} ${DATABASE} -e "source ${USERS_DB_CONTROL};"


show-users:
		@echo "Listando usuarios creados ..."
		docker exec -it $(SERVICE_NAME)  mysql -uroot -p$(PASSWORD) ${DATABASE}  -e "source ./script_sql/users_query.sql";



down: 
		@echo "Removiendo base de datos ..."
		docker exec -it ${SERVICE_NAME} mysql -u${USER} -p${PASSWORD} -e "DROP DATABASE IF EXISTS ${DATABASE};"
		@echo "Adios !!."
		docker compose -f ${DOCKER_COMPOSE_FILE} down