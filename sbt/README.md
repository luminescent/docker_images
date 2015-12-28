#Scala and Sbt Docker image

This image contains Scala 2.11.7 and the latest currently available version of sbt. Use this to build Scala projects.

*Build* the image with `build.sh`. 

The `SAMPLE.run.sh` shows how to use a *container*. Specify the `/source` volume and place the source code to be built there. Then pass sbt commands to the container (including sbt, e.g. `sbt compile`). The resulting artifacts will be placed in the default sbt artifact location (`/source/target`).
