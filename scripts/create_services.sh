#!/bin/bash
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock service create --name foo --mode global --constraint node.role==worker --image test-service
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock service create --name bar --replicas 2 --constraint node.role==worker --image test-service

