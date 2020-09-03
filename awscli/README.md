# Docker image aws-cli
- Base alpine image
- Install bash 
- Install jq
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
## Run auto with user home dir
```
alias awscli='docker run --rm -it -v $(cd ~;pwd)/:/root/ --name awscli awscli bash'
awscli
```
