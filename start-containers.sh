#!/bin/bash

# Networks
docker network create --driver bridge --subnet=10.10.10.0/24 manager1
docker network create --driver bridge --subnet=10.10.20.0/24 manager2
docker network create --driver bridge --subnet=10.10.30.0/24 manager3
docker network create --driver bridge --subnet=10.10.40.0/24 worker1
docker network create --driver bridge --subnet=10.10.50.0/24 worker2


# Router
docker run --detach --hostname router --name router \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester \
	--privileged \
	swarmkit-stress-tester /scripts/router.sh

docker network connect --ip 10.10.10.2 manager1 router
docker network connect --ip 10.10.20.2 manager2 router
docker network connect --ip 10.10.30.2 manager3 router
docker network connect --ip 10.10.40.2 worker1 router
docker network connect --ip 10.10.50.2 worker2 router


# Manager nodes
docker run --detach --hostname manager1 --name manager1 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester \
	--ip 10.10.10.11 \
	--privileged \
	--network manager1 \
	swarmkit-stress-tester /scripts/manager1.sh
	
docker run --detach --hostname manager2 --name manager2 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester \
	--ip 10.10.20.11 \
	--privileged \
	--network manager2 \
	swarmkit-stress-tester /scripts/manager2.sh
	
docker run --detach --hostname manager3 --name manager3 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester \
	--ip 10.10.30.11 \
	--privileged \
	--network manager3 \
	swarmkit-stress-tester /scripts/manager3.sh


# Workers
docker run --detach --hostname worker1 --name worker1 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester \
	--ip 10.10.40.11 \
	--privileged \
	--network worker1 \
	swarmkit-stress-tester /scripts/worker1.sh
	
docker run --detach --hostname worker2 --name worker2 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester \
	--ip 10.10.50.11 \
	--privileged \
	--network worker2 \
	swarmkit-stress-tester /scripts/worker2.sh
	

# Example services
docker run \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester \
	--rm \
	swarmkit-stress-tester /scripts/create_services.sh
