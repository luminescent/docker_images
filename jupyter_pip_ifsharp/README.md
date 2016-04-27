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

The image exposes the port `8888` and the volume `notebooks`. Jupyter is configured to start in this folder. Use the container via the browser on `http://localhost:8888` (or, when using Boot2Docker, put your Docker VM's IP address instead of `localhost`). This will display whatever exists in your mount for `notebooks` and will also save new notebooks and checkpoints there.
 
> The container accepts connections from any IP address on 8888, please be aware of the security risks with this approach. 