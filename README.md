# swarmkit-stress-tester
Main purpose of this tool is to be able reproduce [moby/moby#35011](https://github.com/moby/moby/issues/35011) on lab environment so possible solutions can be also tested.

These scripts creates three managers + two workers configuration over single docker host.
All connections between these goes through router container so it is able generate connection failures between swarm nodes.
![](architecture.png)

# Build test image
```bash
docker build . --build-arg GITHUBACCOUNT=docker --build-arg BRANCH=master -t swarmkit-stress-tester
```

# Usage
## Prepare
Start containers with script:
```bash
./start-containers.sh
```

## Debug
Open debug console and check list of nodes and services
```bash
docker run -it -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester --rm --name debug swarmkit-stress-tester bash
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock node ls
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock service ls
```

## Actual stress tests
Open bash inside of router container:
```bash
docker exec -it router bash
```

### Running stress test 1
```bash
/scripts/run-stress-test-1.sh
```

### Running stress test 2
```bash
/scripts/run-stress-test-2.sh
```


# Cleanup
This command will stop all containers and remove content of /tmp/swarmkit-stress-tester
```bash
./stop-containers.sh
```
