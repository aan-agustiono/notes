#### docker-compose-mongodb.yaml
```
version: '3'
services:
  mongodb:
    container_name: my-mongodb-container
    image: mongo:latest
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: adminpassword
    volumes:
      - mongodb-data:/data/db
    ports:
      - "27017:27017"
    restart: always
volumes:
  mongodb-data:
```

#### 
```
docker-compose -f docker-compose-mongodb.yaml up -d
```
