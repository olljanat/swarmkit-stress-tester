#!/bin/bash

echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Looping manager1 interface down/up five times with 100ms delay
for (( c=1; c<=5; c++ ))
do
	ifconfig eth1 down
	sleep .1s
	ifconfig eth1 up
	sleep .1s
done
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Done. Waiting 10 seconds before next test
sleep 10s


echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Looping manager2 interface down/up five times with 100ms delay
for (( c=1; c<=5; c++ ))
do
	ifconfig eth2 down
	sleep .1s
	ifconfig eth2 up
	sleep .1s
done
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Done. Waiting 10 seconds before next test
sleep 10s


echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Looping manager3 interface down/up five times with 100ms delay
for (( c=1; c<=5; c++ ))
do
	ifconfig eth3 down
	sleep .1s
	ifconfig eth3 up
	sleep .1s
done
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Done. Waiting 10 seconds before next test
sleep 10s


echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Looping worker1 interface down/up five times with 100ms delay
for (( c=1; c<=5; c++ ))
do
	ifconfig eth4 down
	sleep .1s
	ifconfig eth4 up
	sleep .1s
done
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Done. Waiting 10 seconds before next test
sleep 10s


echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Looping worker2 interface down/up five times with 100ms delay
for (( c=1; c<=5; c++ ))
do
	ifconfig eth5 down
	sleep .1s
	ifconfig eth5 up
	sleep .1s
done
echo $(date --utc "+%Y-%m-%d %H:%M:%S") - Done
