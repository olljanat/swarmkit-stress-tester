#!/bin/bash
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock service create --name foo --mode global --constraint node.role==worker --image alpine --command ping --args 9.9.9.9
swarmctl -s /tmp/swarmkit-stress-tester/manager1.sock service create --name bar --replicas 2 --constraint node.role==worker --image alpine --command ping --args 8.8.8.8
