# swarmkit-stress-tester
# Build test image
```bash
docker build . --build-arg BRANCH=master -t swarmkit-stress-tester
```

Run tests coming with Swarmkit
```bash
docker run -it -v /var/run/docker.sock:/var/run/docker.sock --rm swarmkit-stress-tester make all
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
### Running stress test 1
```bash
docker run -it --rm swarmkit-stress-tester /scripts/run-stress-test-1.sh
```

### Running stress test 2
```bash
docker run -it --rm swarmkit-stress-tester /scripts/run-stress-test-2.sh
```


# Cleanup
This command will stop all containers and remove content of /tmp/swarmkit-stress-tester
```bash
./stop-containers.sh
```
