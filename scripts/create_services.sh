#!/bin/bash
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock service create --name foo --replicas 2 --replicas-max-per-node 1 --constraint node.role==worker --image test-service
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock service create --name bar --replicas 2 --replicas-max-per-node 1 --constraint node.role==worker --image test-service

