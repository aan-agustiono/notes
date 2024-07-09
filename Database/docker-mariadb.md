####  docker-compose-mariadb.yaml
```
version: '3'
services:
  mariadb:
    container_name: my-mariadb-container
    image: mariadb:latest
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: mydatabase
      MYSQL_USER: myuser
      MYSQL_PASSWORD: mypassword
    volumes:
    volumes:
      - mariadb-data:/var/lib/mysql
    ports:
      - "3306:3306"
    restart: always

volumes:
  mariadb-data:
```

#### Running
```
docker-compose -f docker-compose-mariadb.yaml up -d
```
