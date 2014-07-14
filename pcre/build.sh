#!/bin/bash

set -e

mkdir -p distfiles src build destroot

ARCHIVE=distfiles/pcre-8.35.tar.gz
SRC=src/`basename ${ARCHIVE} .tar.gz`

if [ ! -f $ARCHIVE ]; then
  (
    cd distfiles
    wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.35.tar.gz
  )
fi

if [ ! -e $SRC ]; then
  tar xzf $ARCHIVE -C src
fi

(
  cd build

  if [ ! -f config.status ]; then
    ../$SRC/configure --prefix=/usr
  fi

  make -j 8
)

make -C build DESTDIR=$PWD/destroot install
