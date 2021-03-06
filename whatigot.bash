#!/usr/bin/env bash

got() {
    local cmd=$1

    type -P "$cmd" >/dev/null
}

# Ubuntu 16.04
#   BIND 9.10.3-P4-Ubuntu <id:ebd72b3>
# Centos 7
#   BIND 9.9.4-RedHat-9.9.4-51.el7 (Extended Support Version)
bind() {
    got named &&
        $_ -v |
        sed 's/^BIND \([^ ]*\).*/BIND: \1/'
}

# Source
#   Composer version 1.5.2 2017-09-11 16:59:25
# Ubuntu 16.04
#   Composer version @package_branch_alias_version@ (1.0.0-beta2) 2016-03-27 16:00:34
composer() {
    got composer &&
        COMPOSER_ALLOW_SUPERUSER=1 command $_ -V |
        sed 's/.*\([0-9]\+\.[0-9]\+\.[0-9]\+\(-\w\+\)\?\).*/Composer: \1/'
}

# Ubuntu 16.04
#   Docker version 1.12.6, build 78d1802
docker() {
    got docker &&
        command $_ -v |
        sed 's/.*version \([0-9.]*\).*/Docker: \1/'
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

# Ubuntu 16.04
#   nginx version: nginx/1.10.3 (Ubuntu)
nginx() {
    got nginx &&
        command $_ -v 2>&1 |
        sed 's/.*version: nginx\/\([^ ]*\).*/NGINX: \1/'
}

opendkim() {
    got opendkim &&
        command $_ -V |
        sed 's/.*OpenDKIM Filter v\(.*\)/OpenDKIM: \1/;q'
}

# CentOS 7
#   This is perl 5, version 16, subversion 3 (v5.16.3) built for x86_64-linux-thread-multi
perl() {
    got perl &&
        command $_ -v |
        sed '/^This is perl/ {s/.*(v\([^)]*\)).*/Perl: \1/;q};d'
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

# Ubuntu 16.04
#   Python 2.7.13
python() {
    got python &&
        command $_ -V 2>&1 |
        sed 's/ /:&/'
}

squid() {
    got squid &&
        command $_ -v |
        sed 's/.*Version \(.*\)/Squid: \1/;q'
}

# Ubuntu 16.04
#   varnishd (varnish-4.1.1 revision 66bb824)
varnish() {
    got varnishd &&
        $_ -V 2>&1 |
        sed 's/.*(varnish-\([^ ]*\).*/Varnish: \1/;q'
}

znc() {
    got znc &&
        command $_ -v |
        sed 's/^ZNC \([^ ]*\).*/ZNC: \1/;q'
}

printf "${header=$(lsb_release -d | cut -f2)}\n$(sed s/./=/g<<<"$header")\n\n"

bind
composer
docker
exiftool
imagemagick
mongo
nginx
opendkim
perl
php
postfix
python
squid
varnish
znc
