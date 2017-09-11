#!/usr/bin/env bash

got() {
    local cmd=$1

    which "$cmd" >/dev/null
}

bind9() {
    got bind9-config &&
        $_ --version |
        sed 's/^VERSION=\(.*\)/Bind9: \1/'
}

composer() {
    got composer &&
        command $_ -V |
        sed 's/.*version \([^ ]*\).*/Composer: \1/'
}

docker() {
    got docker &&
        command $_ -v |
        sed 's/.*version \(.*\)/Docker: \1/'
}

exiftool() {
    got exiftool && echo "ExifTool: $(command $_ -ver)"
}

imagemagick() {
    got identify &&
        $_ --version |
        sed 's/^Version: \(ImageMagick\) \([^ ]*\).*/\1: \2/;q'
}

mongo() {
    got mongod &&
        $_ --version |
        sed 's/.*version v\(.*\)/MongoDB: \1/;q'
}

nginx() {
    got nginx &&
        command $_ -v 2>&1 |
        sed 's/.*version: nginx\/\(.*\)/NGINX: \1/'
}

opendkim() {
    got opendkim &&
        command $_ -V |
        sed 's/.*OpenDKIM Filter v\(.*\)/OpenDKIM: \1/;q'
}

php() {
    got php &&
        command $_ -v |
        sed 's/^PHP \([^ ]*\).*/PHP: \1/;q'
}

postfix() {
    got postconf &&
        $_ mail_version |
        sed 's/.*= *\(.*\)/Postfix: \1/'
}

squid() {
    got squid &&
        command $_ -v |
        sed 's/.*Version \(.*\)/Squid: \1/;q'
}

varnish() {
    got varnishd &&
        $_ -V 2>&1 |
        sed 's/.*(varnish-\(.*\)).*/Varnish: \1/;q'
}

printf "${header=$(lsb_release -ds)}\n$(sed s/./=/g<<<"$header")\n\n"

bind9
composer
docker
exiftool
imagemagick
mongo
nginx
opendkim
php
postfix
squid
varnish
