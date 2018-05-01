#!/bin/bash

echo $(date --utc "+%Y-%m-%d %H:%M:%S") - manager1 interface down
ifconfig eth1 down
sleep 10s
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - manager1 interface up
ifconfig eth1 up
sleep 10s


echo $(date --utc "+%Y-%m-%d %H:%M:%S") - manager2 interface down
ifconfig eth2 down
sleep 10s
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - manager2 interface up
ifconfig eth2 up
sleep 10s


echo $(date --utc "+%Y-%m-%d %H:%M:%S") - manager3 interface down
ifconfig eth3 down
sleep 10s
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - manager3 interface up
ifconfig eth3 up
sleep 10s


echo $(date --utc "+%Y-%m-%d %H:%M:%S") - worker1 interface down
ifconfig eth4 down
sleep 10s
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - worker1 interface up
ifconfig eth4 up
sleep 10s


echo $(date --utc "+%Y-%m-%d %H:%M:%S") - worker2 interface down
ifconfig eth5 down
sleep 10s
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - worker2 interface up
ifconfig eth5 up
