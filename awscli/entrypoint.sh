#!/bin/bash
echo 'complete -C aws_completer aws' >>/etc/profile.d/aws_complete.sh
aws --version
cd ~
. /etc/profile
exec $@
