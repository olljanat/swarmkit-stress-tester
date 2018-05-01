#!/bin/bash
docker stop --time 0 worker2
docker stop --time 0 worker1
docker stop --time 0 manager3
docker stop --time 0 manager2
docker stop --time 0 manager1
docker stop --time 0 router

docker rm worker2
docker rm worker1
docker rm manager3
docker rm manager2
docker rm manager1
docker rm router

docker network rm worker2
docker network rm worker1
docker network rm manager3
docker network rm manager2
docker network rm manager1

sudo rm -rf /tmp/swarmkit-stress-tester/

docker rm --force $(docker ps --filter name=foo* -q)
docker rm --force $(docker ps --filter name=bar* -q)