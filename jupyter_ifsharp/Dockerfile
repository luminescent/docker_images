FROM continuumio/anaconda3
MAINTAINER luminescent

# Get and install mono
RUN apt-get update \
	&& apt-get install -y curl \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy/snapshots/4.2.3.4 main" > /etc/apt/sources.list.d/mono-xamarin.list \
	&& apt-get update \
	&& apt-get install -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget \
	&& rm -rf /var/lib/apt/lists/*


# Get and install the IfSharp kernel
RUN git clone https://github.com/luminescent/IfSharp.git
WORKDIR IfSharp
RUN git checkout jupyter
RUN ./build.sh
WORKDIR bin
RUN mono ifsharp.exe


# How we communicate with the IfSharp kernel
EXPOSE 8888

RUN mkdir notebooks
VOLUME notebooks


ENTRYPOINT ["jupyter-notebook", "--ip='*'", "--notebook-dir=/notebooks", "--config=/.local/share/jupyter/kernels/ifsharp/ipython_config.py"]

