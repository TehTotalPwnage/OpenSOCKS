#!/bin/bash
docker create --name opensocks_dev --publish 1080:1080 --device=/dev/net/tun --cap-add=NET_ADMIN --dns 208.67.222.222 opensocks
