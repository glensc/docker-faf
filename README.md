# FAF in Docker

Configuration is placed in the `config` file.

To build:
```bash
./faf-docker-build
```

To install:
(creates data directories on the host and initializes the database)
```bash
docker run -i -t --rm --privileged -v /:/host -e HOST=/host -e LOGDIR=/var/log/faf-docker -e CONFDIR=/etc/faf-docker -e DATADIR=/var/lib/faf-docker -e IMAGE=mbrysa/faf:fedora mbrysa/faf:fedora faf-install

docker run -i -t -v /var/lib/faf-docker/pgsql:/var/lib/pgsql -v /var/lib/faf-docker/faf:/var/spool/faf mbrysa/faf:fedora faf-action pull-releases -o fedora -v
```

To run a FAF action (only while the server is stopped):
```bash
docker run -i -t -v /var/lib/faf-docker/pgsql:/var/lib/pgsql -v /var/lib/faf-docker/faf:/var/spool/faf -v /etc/faf-docker:/etc/faf mbrysa/faf:fedora faf-action [action name and parametrs here]
```

Add different Operating system releases like:
```bash
docker run -i -t -v /var/lib/faf-docker/pgsql:/var/lib/pgsql -v /var/lib/faf-docker/faf:/var/spool/faf -v /etc/faf-docker:/etc/faf mbrysa/faf:fedora faf-action releaseadd -o rhel --opsys-release '7.0'
```

To run the server:
```bash
docker run -p 8888:80 -i -t -v /var/lib/faf-docker/pgsql:/var/lib/pgsql -v /var/lib/faf-docker/faf:/var/spool/faf -v /etc/faf-docker:/etc/faf mbrysa/faf:fedora
```
Open `http://127.0.0.1:8888/faf2/`.
