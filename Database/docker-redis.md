#### docker-compose-redis.yaml
```
version: '3'
services:
  redis:
    container_name: my-redis-container
    image: redis:latest
    volumes:
      - redis-data:/data
    ports:
      - "6379:6379"
    restart: always

volumes:
  redis-data:
```

#### Running
```
docker-compose -f docker-compose-redis.yaml up -d
```
