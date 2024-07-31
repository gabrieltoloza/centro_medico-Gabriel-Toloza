if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo ".env no encontrado"
    exit 1
fi



# Wait until MySQL is ready
until docker exec -it mysql mysql -u"$MYSQL_USER" -p"$MYSQL_ROOT_PASSWORD" -e "\q"
do
    echo "Esperando que MySQL este listo ..."
    sleep 4
done

echo "MySQL esta listo."