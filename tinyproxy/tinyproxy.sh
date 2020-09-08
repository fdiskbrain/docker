#/usr/bin/env bash
nameProxy="myproxy"
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
    docker start ${nameProxy} || create && echo start success
}
restart(){
    docker restart ${nameProxy}
}
status(){
    docker inspect ${nameProxy}
}
usage(){
    echo $0 create remove start stop restart
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
