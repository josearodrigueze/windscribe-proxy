#!/bin/sh

echo "1.1.1.1" | sed -e 's/^/nameserver /' -e 's/,/\nnameserver /' > /etc/resolv.conf

# so return traffic that went through VPN works
gw=$(ip route | awk '$1 == "default" { print $3 }')
printf "\nforward %s/ . \n " "${gw}" >> /etc/privoxy/config

#echo "ip route add to ${LOCAL_NETWORK} via $gw dev eth0"
#ip route add to ${LOCAL_NETWORK} via $gw dev eth0


