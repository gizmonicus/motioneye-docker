#!/bin/bash
docker run -d -p 8765:8765 -v /etc/localtime:/etc/localtime -v /srv/array/local/docker/volumes/motioneye/media:/var/lib/motioneye -v /srv/array/local/docker/volumes/motioneye/conf:/etc/motioneye --dns 192.168.11.2 --hostname motioneye.gizmonic.us --restart always --name motioneye gizmonicus/motioneye-docker
