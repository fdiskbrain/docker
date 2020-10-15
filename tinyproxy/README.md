# Tinyproxy

- A light http/https Proxy 

## Build

```
docker build -t tinyproxy .
```
## Build in China

1. local build
```
docker build --build-arg CN=1 -t tinyproxy .
```
2. Mutil platform build
```
docker buildx build --build-arg CN=1 --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 -t fdiskbrain/tinyproxy --push .
```
## How to use
1. Prepare docker env 
2. Init env
```
cp tinyproxy.sh ~/bin/
chmod +x ~/bin/tinyproxy.sh
exprot PATH="$HOME/bin:$PATH"
```
3. Start tinyproxy
```
tinyproxy.sh start
```
