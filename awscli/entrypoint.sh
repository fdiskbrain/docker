#!/bin/bash
echo 'complete -C aws_completer aws' >>/etc/profile
aws --version
cd ~
. /etc/profile
exec $@
