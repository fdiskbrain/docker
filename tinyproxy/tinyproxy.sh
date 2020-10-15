#/usr/bin/env bash
nameProxy="myproxy"
init(){
    mkdir -p ~/data/app/tinyproxy
    [ -f ~/data/app/tinyproxy/tinyproxy.conf ] && cp ~/data/app/tinyproxy/tinyproxy.conf ~/data/app/tinyproxy/tinyproxy.conf.$$.bak
    cat >~/data/app/tinyproxy/tinyproxy.conf<<EOF
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
upstream none "127.0.0.1/32"
upstream none "192.168.0.0/16"
upstream none "10.0.0.0/8"
upstream none "172.16.0.0/12"
upstream none "."
EOF
}
create(){
    docker run --name ${nameProxy}  -d -p 8888:8888 -v ~/data/app/tinyproxy/:/etc/tinyproxy/ fdiskbrain/tinyproxy
}
remove(){
    docker rm -f ${nameProxy}
}
stop(){
    docker stop ${nameProxy}
}
start(){
    [ -f ~/data/app/tinyproxy/tinyproxy.conf ] || init
    docker start ${nameProxy} || create && echo start success
}
restart(){
    docker restart ${nameProxy}
}
status(){
    docker inspect ${nameProxy}
}
usage(){
    echo $0
    cat <<EOF
    create remove start stop restart
EOF
    exit 1
}
if [ -z $1 ]; then
    usage
fi
case $1 in
    status)
        status
        ;;
    stop)
        stop
        ;;
    start)
        start
        ;;
    restart)
        restart
        ;;
    create)
        create
        ;;
    remove)
        remove
        ;;
    *)
        usage
esac
