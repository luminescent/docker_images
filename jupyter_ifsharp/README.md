# Jupyter notebook Docker file

This Dockerfile contains a [Jupyter](http://jupyter.org/) [F#](https://github.com/fsprojects/IfSharp) kernel.
  
Build the image with: 

```
docker build -t jupyter_ifsharp:1.0 .
```

Run the image with:

```
docker run -it -p 8888:8888 -v /your_host_path_here:/notebooks jupyter_ifsharp:1.0
```

The image exposes the port `8888` and the volume `notebooks`. Jupyter is configured to start in this folder.  