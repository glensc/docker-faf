# FAF in Docker

Configuration is placed in the `config` file.

To build:
```bash
./faf-docker-build
```

Create the persistent storage directory specified in the `config` file then init storage:
```bash
./faf-init
./faf-docker-run faf-action pull-releases -o fedora -v
```

To run:
```bash
./faf-docker-run
```
Open `http://127.0.0.1:8888/faf2/`.
