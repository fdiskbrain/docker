FROM alpine:3.11.2
LABEL Name=tinyproxy Version=0.0.1 OS=alpine:3.11.2
ARG CN=0
RUN [[ ${CN} == 1 ]] && sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
 ;apk add --no-cache tinyproxy 
EXPOSE 8888
VOLUME [ "/etc/tinyproxy" ]
CMD ["tinyproxy", "-d"]

