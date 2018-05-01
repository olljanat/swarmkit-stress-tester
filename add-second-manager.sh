#!/bin/bash
	
docker run --detach --hostname manager2 --name manager2 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester \
	--ip 10.10.20.11 \
	--privileged \
	--network manager2 \
	swarmkit-stress-tester /scripts/manager2.sh
