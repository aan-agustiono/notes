
#### docker-compose-postgresql.yaml
```
version: '3'
services:
  postgres:
    container_name: my-postgresql-container
    image: postgres:latest
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: mydatabase
    volumes:
      - postgres-data:/var/lib/postgresql/data
    ports:
      - "5432:5432"
    restart: always

volumes:
  postgres-data:
```

#### Running
```
docker-compose -f docker-compose-postgresql.yaml up -d
```
