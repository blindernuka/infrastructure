# server-2018

This server is a CoreOS instance.

## Initial setup

```bash
mkdir -p /home/core/data
./setup-docker-compose.sh
./setup-git-crypt.sh
docker network create uka
```

## Running services

```
docker-compose up -d
```

TODO: billett

## Database administration

### From internal

Use the `mysql-shell.sh` script. It will mount /home/core to /data.

### From external

Use a tunnel, replace hostname if needed.

```bash
ssh -L 127.0.0.1:8082:127.0.0.1:8082 core@uka.zt.hsw.no
```

http://localhost:8082/

Connect to `uka-database` with user `root` and password from the
`database-secrets.env`-file.
