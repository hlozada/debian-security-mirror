#!/bin/bash

export GNUPGHOME=/srv/mirrors/.gnupg

logfile=/var/log/debian-security.log

status=1
pid=$$

arch=amd64,i386
section=main,contrib,non-free
release=jessie-updates
server=ftp.de.debian.org
inPath=/debian
proto=rsync
outPath=/srv/mirrors/debian-security

/usr/bin/debmirror       -a $arch \
                --nosource \
                -s $section \
		--i18n \
                -h $server \
                -d $release \
                -r $inPath \
                --progress \
		--getcontents \
		--diff=use \
		--ignore-small-errors \
		--ignore-missing-release \
		--ignore-release-gpg \
		--cleanup \
                -e $proto \
                $outPath >>$logfile
status=$?
