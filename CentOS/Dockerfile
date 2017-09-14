FROM centos:7
MAINTAINER Bilge <bilge@scriptfusion.com>

COPY whatigot.bash /

CMD ["/whatigot.bash"]

RUN yum install -y epel-release
RUN yum install -y --nogpgcheck\
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
