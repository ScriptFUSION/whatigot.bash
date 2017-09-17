FROM blitznote/debootstrap-amd64:16.04

COPY whatigot.bash /

CMD ["/whatigot.bash"]

RUN apt-get -q update &&\
    apt-get -y install\
        lsb-release\
        bind9\
        composer\
        docker.io\
        libimage-exiftool-perl\
        imagemagick\
        mongodb-server\
        nginx-light\
        opendkim\
        postfix\
        squid\
        varnish\
        znc
