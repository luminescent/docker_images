#!/bin/bash

docker run -i -t \
	-p 2113:2113 -p 1113:1113 \
	-v /home/christina/projects/temp/data/db:/db  -v /home/christina/projects/temp/data/logs:/logs \
	eventstore:latest \
	--ext-http-prefixes=http://*:2113/ --ext-ip=0.0.0.0 
