#!/bin/bash

for f in $(find . -name \*.jpg); do
    n=$(md5sum $f|awk '{print $1}')
    nf=$(dirname $f)/${n:9:16}.jpg
    if [ "$nf" != "$f" ]; then
        mv -v $f $nf
    fi
done
