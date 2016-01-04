#Eventstore Docker image

This Dockerfile builds an image for the latest stable release of [Eventstore](https://www.geteventstore.com/downloads/), with Mono statically linked. 

*Build* using `build.sh`. It will produce the image `eventstore:latest`.

`SAMPLE.run.sh` contains an example for *running a container*. The `2113` and `1113` ports are exposed. The `/db` and `/logs` volumes are also exposed for persisting data between new containers runs. Not setting the volumes will result in a behaviour similar to the 'in memory' run. Running multiple Eventstore containers on the same host is possible by mitigating the port forwarding on the host (e.g. run one container with `-p 2113:2113` and another one with `-p 9113:2113`).

Put all of the parameters you need to pass to the Eventstore process into the run command (e.g. `--ext-http-prefixes=http://*:2113/ --ext-ip=0.0.0.0`; see [full list](http://docs.geteventstore.com/server/3.4.0/command-line-arguments//)). Note that these two `--ext-http-prefixes=http://*:2113/ --ext-ip=0.0.0.0` are required most of the time. Without them, Eventstore is essentially locked inside the container - it can not accept commands from other than its localhost.

