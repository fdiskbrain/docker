FROM alpine
ARG CN=0

RUN [ $CN -eq 1 ] && sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
    apk add --no-cache \
    aws-cli \
    aws-cli-bash-completion \
    aws-cli-completer \
    bash \
    bash-completion 
# && echo '. /etc/profile' >~/.bashrc \
# && echo 'complete -C aws_completer aws' >>~/.bashrc
ADD . .
ENTRYPOINT [ "./entrypoint.sh" ]
