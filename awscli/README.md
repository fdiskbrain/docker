# Docker image aws-cli
- Base alpine image
- Install bash 
- Install awscli
- Bash and awscli completion
## Build
```
docker build -t awscli .
```
## Build in China
```
docker build --build-arg CN=1 -t awscli .
```

## Run
```
docker run --rm -it awscli bash
```
## Run with ENV file ~/.env
```
docker run --env-file ~/.env --rm -it awscli bash
```