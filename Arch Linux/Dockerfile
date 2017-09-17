FROM finalduty/archlinux

COPY whatigot.bash /

CMD ["/bin/bash", "-l", "/whatigot.bash"]

RUN pacman -S --noconfirm\
    extra/bind\
    extra/composer\
    community/docker\
    extra/perl-image-exiftool\
    extra/imagemagick\
    community/mongodb\
    extra/nginx\
    community/opendkim\
    extra/postfix\
    extra/python\
    community/squid\
    extra/varnish\
    community/znc
