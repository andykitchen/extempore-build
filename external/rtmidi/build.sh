#!/bin/bash

set -e

mkdir -p distfiles src destroot

ARCHIVE=distfiles/rtmidi-2.1.0.tar.gz
SRC=src/`basename ${ARCHIVE} .tar.gz`

if [ ! -f $ARCHIVE ]; then
  (
    cd distfiles
    wget http://www.music.mcgill.ca/~gary/rtmidi/release/rtmidi-2.1.0.tar.gz
  )
fi

if [ ! -e $SRC ]; then
  tar xzf $ARCHIVE -C src
fi

(
  cd $SRC

  if [ ! -f config.status ]; then
    ./configure --prefix=/usr
  fi

  make -j 8
)

mkdir -p destroot/usr/lib
cp $SRC/librtmidi.2.1.0.dylib $SRC/librtmidi.dylib destroot/usr/lib
