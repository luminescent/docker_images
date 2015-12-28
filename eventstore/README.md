#Eventstore Docker image

This Dockerfile builds an image for the latest stable release of [Eventstore](https://www.geteventstore.com/downloads/), with Mono statically linked. 

*Build* using `build.sh`. It will produce the image `eventstore:latest`.

`SAMPLE.run.sh` contains an example for *running a container*. The `2113` and `1113` ports must be specified. The `/data/db` and `/data/logs` volumes must be specified. 
Put all of the parameters you need for the Eventstore service into the run command (e.g. `--ext-http-prefixes=http://*:2113/ --ext-ip=0.0.0.0`; see [full list](http://docs.geteventstore.com/server/3.4.0/command-line-arguments//)).

