#!/bin/bash
sudo route add -net 10.10.20.0 netmask 255.255.255.0 gw 10.10.10.2
sudo route add -net 10.10.30.0 netmask 255.255.255.0 gw 10.10.10.2
sudo route add -net 10.10.40.0 netmask 255.255.255.0 gw 10.10.10.2
sudo route add -net 10.10.50.0 netmask 255.255.255.0 gw 10.10.10.2
/usr/local/bin/swarmd -d /tmp/swarmkit-stress-tester/manager1 --listen-control-api /tmp/swarmkit-stress-tester/manager1.sock --listen-remote-api 10.10.10.11:4242 --advertise-remote-api 10.10.10.11:4242 --hostname manager1
