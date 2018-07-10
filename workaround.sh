#!/bin/bash
echo "Restarting manager1"
docker restart manager1

echo "Waiting for two minutes"
sleep 120

echo "Restarting manager2"
docker restart manager2

echo "Waiting for two minutes"
sleep 120

echo "Restarting manager3"
docker restart manager3

echo "Waiting for two minutes"
sleep 120
