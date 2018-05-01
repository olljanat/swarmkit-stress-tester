#!/bin/bash
sudo route add -net 10.10.10.0 netmask 255.255.255.0 gw 10.10.20.2
sudo route add -net 10.10.30.0 netmask 255.255.255.0 gw 10.10.20.2
sudo route add -net 10.10.40.0 netmask 255.255.255.0 gw 10.10.20.2
sudo route add -net 10.10.50.0 netmask 255.255.255.0 gw 10.10.20.2
sleep 10s
TOKEN=$(/usr/local/bin/swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock cluster inspect default | grep Manager | awk -F': ' '{print $2}')
/usr/local/bin/swarmd -d /tmp/swarmkit-stress-tester/manager2 --join-addr 10.10.10.11:4242 --join-token $TOKEN --listen-control-api /tmp/swarmkit-stress-tester/manager2.sock --listen-remote-api 10.10.20.11:4243 --hostname manager2
