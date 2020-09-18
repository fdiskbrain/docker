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
1. Prepare tinyproxy
```
mkdir -p ~/data/app/tinyproxy

```
```
cat >~/data/app/tinyproxy/tinyproxy.conf.a<<EOF
User tinyproxy
Group tinyproxy

Port 8888
Timeout 600
DefaultErrorFile "/usr/share/tinyproxy/default.html"
StatFile "/usr/share/tinyproxy/stats.html"
LogFile "/etc/tinyproxy/tinyproxy.log"
LogLevel Info
MaxClients 100

MinSpareServers 5
MaxSpareServers 20

StartServers 10

MaxRequestsPerChild 0
ViaProxyName "tinyproxy"
## upstream http  127.0.0.1:80 ".paypal.com"
upstream none "."
EOF
```
