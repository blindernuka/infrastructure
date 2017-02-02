# z-backend

See https://github.com/cybrairai/z-backend for more details.

See also https://github.com/cybrairai/drift/tree/master/z-backend
which this setup is inspired by.

## Set up and updating

Make sure the files `uka/reports.json` are
created before starting the containers.

- `touch uka/reports.json`

Update sources, (re)build Docker image and start containers:

- `./update-source.sh`
- `docker-compose build`
- `docker-compose up -d`
