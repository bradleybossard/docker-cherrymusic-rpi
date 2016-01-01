FROM miek/alpine-armv6l
MAINTAINER Bradley Bossard <bradleybossard@gmail.com>

# install requirements
RUN apk update &&\
    apk add python3\
            ffmpeg\
            flac\
            curl

# TODO(bradleybossard) : Figure out why updating pip causes build to fail
#RUN pip3 install --upgrade pip &&\
RUN pip3 install cherrypy &&\
    pip3 install cherrymusic

ADD cherrymusic.conf /root/.config/cherrymusic/cherrymusic.conf

VOLUME ["/music", "/root/.local"]
EXPOSE 3000
CMD rm -f /root/.local/share/cherrymusic/cherrymusic.pid && exec cherrymusic --port 3000
