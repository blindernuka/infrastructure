# server-2018

This server is a [CoreOS Container Linux](https://coreos.com/os/) instance running as a
virtual machine. CoreOS auto updates and reboots when needed. The services running need
to be updated manually.

## Accessing the server

The instance does not have its own public IP. The server is running on a ZeroTier VPN,
and is also connected with other servers, such as foreningenbs.no. SSH keys must be used.
A shared key can be found at https://foreningenbs.no/confluence/x/qgYf

### From internet

From the internet the server is available by SSH on core@server2016.blindernuka.no:2222.

E.g.

```bash
# forward SSH agent to be able to git pull/push
ssh -A -p 2222 core@server2016.blindernuka.no
```

### From the VPN

The VM is set up so that its internal IP is actually part of a VPN. The VPN
is also in use on foreningenbs.no.

```
bash
# forward SSH agent to be able to git pull/push
ssh -A core@uka.zt.hsw.no
```

From athene.foreningenbs.no, the root use also have the key registered, so
a simple connect can be:

```bash
ssh USER@foreningenbs.no
sudo ssh core@uka.zt.hsw.no
```

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

TODO: billett (it is also set up on the same server)

## Database administration

### From internal

Use the `mysql-shell.sh` script. It will mount /home/core to /data.

```
# for direct login to mysql shell
./mysql-shell.sh

# for shell access with mysql tools
./mysql-shell.sh bash
```

### From external

Use a tunnel, replace hostname if needed.

```bash
ssh -L 127.0.0.1:8082:127.0.0.1:8082 core@uka.zt.hsw.no
```

http://localhost:8082/

Connect to `uka-database` with user `root` and password from the
`database-secrets.env`-file (as it's encrypted, it is easiest read
on the server itself under `/home/core/infrastructure/server-2018/database-secrets.env`).
