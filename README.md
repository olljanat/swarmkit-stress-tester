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
Start containers with script:
```bash
./start-containers.sh
```

Open debug console and check list of nodes and services
```bash
docker run -it -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/swarmkit-stress-tester:/tmp/swarmkit-stress-tester --rm --name debug swarmkit-stress-tester bash
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock node ls
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock service ls
```


# Cleanup
This command will stop all containers and remove content of /tmp/swarmkit-stress-tester
```bash
./stop-containers.sh
```
