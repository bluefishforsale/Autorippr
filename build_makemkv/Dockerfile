#FROM ubuntu:16.04
FROM lsiobase/xenial

ENV VERS="1.12.2"

RUN apt-get update && apt-get install -y python-virtualenv build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev

ADD http://www.makemkv.com/download/makemkv-bin-${VERS}.tar.gz /src/

ADD http://www.makemkv.com/download/makemkv-oss-${VERS}.tar.gz /src/

RUN tar xf /src/makemkv-bin-${VERS}.tar.gz -C /src

RUN mkdir /src/makemkv-bin-${VERS}/tmp/

RUN echo 'accepted' > /src/makemkv-bin-${VERS}/tmp/eula_accepted

RUN sed -ie 's#DESTDIR=#DESTDIR=/build#g' /src/makemkv-bin-1.10.8/Makefile

RUN cd /src/makemkv-bin-${VERS} && make install

RUN tar xf /src/makemkv-oss-${VERS}.tar.gz -C /src

RUN cd /src/makemkv-oss-${VERS} && ./configure --prefix /build/usr --disable-gui && make install
