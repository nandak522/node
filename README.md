# nodejs
Base Image for all nodejs (v12 LTS) apps

---
## Build Docker Images
> `<version>` mentioned below is defined in `VERSION.txt` file.
```sh
# base image for nanda/hello-universe
docker build -t nanda/node:<version> .
```

---
## Run Docker Container
> `<version>` mentioned below is defined in `VERSION.txt` file.
```sh
# run base image's container
docker run --init -m 300M --memory-swap 1G -it nanda/node:<version>
```
