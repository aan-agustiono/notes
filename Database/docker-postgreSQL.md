# PostgreSQL Menggunakan Docker

## Image yang digunakan

- `postgres:latest`
- `adminer:latest`

Catatan: adminer tidak wajib, hanya untuk memudahkan kita menggunakan postgresql.

## Membuat Services
#### 1. Buat folder untuk menampung postgresql yang akan kita install.
```
~/workspaces/docker-apps/postgres/
```
#### 2. Buat file `docker-compose.yml`
```
vim docker-compose.yml
```
#### 3. Buat service adminer
isi docker-compose.yml menjadi seperti berikut:
```
services:
  db:
    image: postgres
    environment:
      POSTGRES_PASSWORD: 12345
      PGDATA: /var/lib/postgresql/data/pgdata
    volumes:
      - ./data:/var/lib/postgresql/data
    ports:
      - 5432:5432
  adminer:
    image: adminer
    ports:
      - 8012:8080
```

#### 4. Running
```
docker compose up -d
```

#### 5. Akses
  
  5.1 Mengakses via adminer
```
Open address di http://localhost:8012.
- Pilih PostgreSQL sebagai system
- Masukkan 'db' sebagai host (sesuai dengan nama service).
- Isi 'postgres' sebagai username
- dan '12345' sebagai password (sesuai dengan variabel POSTGRES_PASSWORD).
```

  5.2 Mengakses via psql (dari dalam container)
```
docker compose exec -ti db psql -U postgres
```
Keterangan:
- `db` adalah nama service
- `ti` flag ini agar kita bisa melakukan mode interaktif
- `postgres` adalah nama username


#### 6. Finished 
- Reff Links [Installations](https://aksamedia.co.id/blog/postgresql-menggunakan-docker)
