#!/bin/bash

docker run -i -t -p 2113:2113 -p 1113:1113 \
	-v /home/christina/projects/temp/data/db:/data/db  -v /home/christina/projects/temp/data/logs:/data/logs \
	eventstore:latest \
	--ext-http-prefixes=http://*:2113/ --ext-ip=0.0.0.0 --db /data/db --log /data/logs
