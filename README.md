# node
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
docker run --init -it nanda/node:<version>
```
