#!/bin/bash

echo $(date --utc "+%Y-%m-%d %H:%M:%S") - worker1 interface down
ifconfig eth4 down
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - worker2 interface down
ifconfig eth5 down
sleep 60s
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - worker1 interface up
ifconfig eth4 up
sleep 10s
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - worker2 interface up
ifconfig eth5 up
