FROM mono:4.2.3.4

RUN apt-get update && apt-get install -y wget git 

# we now remove all python traces; this uninstalls mono ... 
RUN apt-get purge -y python \
	python2.7 \
	python2.7-minimal

RUN find / -name python* | xargs rm -rf

# Python 3.4 dependencies 
RUN apt-get install -y build-essential \
	libncurses5-dev libncursesw5-dev libreadline6-dev \
	libdb5.1-dev libgdbm-dev libsqlite3-dev libssl-dev \
	libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev

WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.4.4/Python-3.4.4.tgz
RUN tar -zxf Python-3.4.4.tgz
WORKDIR Python-3.4.4
RUN ./configure --prefix=/usr/local/opt/python-3.4.4
RUN make
RUN make install
WORKDIR /tmp
RUN rm -rf Python-3.4.4
RUN rm Python-3.4.4.tgz

env PATH /usr/local/opt/python-3.4.4/bin:$PATH
RUN echo $PATH

RUN pip3 install jupyter


# reinstall mono 
RUN apt-get install -y mono-devel ca-certificates-mono fsharp mono-vbnc nuget

# Get and install the IfSharp kernel
WORKDIR /usr/local/opt
RUN git clone https://github.com/fsprojects/IfSharp.git
WORKDIR IfSharp
RUN git checkout jupyter
RUN ./build.sh
WORKDIR bin
RUN mono ifsharp.exe

# How we communicate with the IfSharp kernel
EXPOSE 8888

WORKDIR /
RUN mkdir notebooks
VOLUME notebooks


ENTRYPOINT ["jupyter-notebook", "--no-browser", "--ip='*'", "--notebook-dir=/notebooks", "--config=/.local/share/jupyter/kernels/ifsharp/ipython_config.py"]


