#### docker-compose-mysql.yaml
```
version: '3'
services:
  mysql:
    container_name: my-mysql-container
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: mydatabase
      MYSQL_USER: myuser
      MYSQL_PASSWORD: mypassword
    volumes:
      - mysql-data:/var/lib/mysql
    ports:
      - "3306:3306"
    restart: always

volumes:
  mysql-data:
```

#### Running
```
docker-compose -f docker-compose-mysql.yaml up -d
```
