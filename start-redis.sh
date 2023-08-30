#!/bin/sh

REDIS_HOST=$(ip -4 addr show eth0 | awk '/inet/ {print $2}' | cut -d/ -f1)
export REDIS_HOST

redis-server --protected-mode no &
flask run --host=0.0.0.0
