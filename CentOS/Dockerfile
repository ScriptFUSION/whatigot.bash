FROM centos:7

COPY whatigot.bash /

CMD ["/whatigot.bash"]

RUN yum install -y epel-release
RUN yum install -y --nogpgcheck\
    bind\
    redhat-lsb-core\
    composer\
    docker-client\
    perl-Image-ExifTool\
    ImageMagick\
    mongodb-server\
    nginx\
    opendkim\
    postfix\
    squid\
    varnish\
    znc
