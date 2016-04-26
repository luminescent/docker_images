FROM gliderlabs/alpine
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>

RUN apk add --update musl git curl perl libgcc libbz2 libffi libgcrypt ncurses-libs build-base python3-dev gfortran
RUN apk add openblas openblas-dev --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

# ENV PYPY pypy3-2.4-linux_x86_64-portable
ENV GLIBC_VER 2.21-r2
# ADD https://bitbucket.org/squeaky/portable-pypy/downloads/${PYPY}.tar.bz2 /tmp/${PYPY}.tar.bz2
ADD https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-${GLIBC_VER}.apk /tmp/glibc-${GLIBC_VER}.apk
ADD https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-${GLIBC_VER}.apk /tmp/glibc-bin-${GLIBC_VER}.apk
# ADD https://bootstrap.pypa.io/get-pip.py /tmp/get-pip.py

RUN cd /tmp/ && \
    apk add --allow-untrusted glibc-${GLIBC_VER}.apk glibc-bin-${GLIBC_VER}.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    rm -rf glibc-${GLIBC_VER}.apk && \
    rm -rf glibc-bin-${GLIBC_VER}.apk
# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

#RUN python get-pip.py 

ENTRYPOINT ["sh"]
