#!/bin/sh
echo '. /etc/profile' >~/.bashrc 
echo 'complete -C aws_completer aws' >>~/.bashrc
aws --version
cd ~
exec $@