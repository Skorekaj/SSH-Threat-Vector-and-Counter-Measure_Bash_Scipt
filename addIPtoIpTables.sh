#!/bin/bash

echo "adding Ip:" $1 

if [[ $1 == *"invalid"* ]]; then # cheks if invalid is in the variable string $1
        echo "Invalid user" 
        echo $1 | /usr/bin/cut -d " " -f13 # cuts/delimits the string with a space and returns the 13th field only
        ip=`echo "$1" | /usr/bin/cut -d " " -f13` # sticks the 13th field (IpAddress) into the variable ip
        echo $ip
        sudo iptables -A INPUT -s $ip -j DROP # updates the IPTables with the offending IP
else
        echo "valid user logon attempt"
        echo $1 | /usr/bin/cut -d " " -f11
        ip=`echo "$1" | /usr/bin/cut -d " " -f11`
        echo $ip
        sudo iptables -A INPUT -s $ip -j DROP
fi 
