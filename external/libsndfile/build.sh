#!/bin/bash

set -e

mkdir -p distfiles src build destroot

ARCHIVE=distfiles/libsndfile-1.0.25.tar.gz
SRC=src/`basename ${ARCHIVE} .tar.gz`

if [ ! -f $ARCHIVE ]; then
  (
    cd distfiles
    wget http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.25.tar.gz
  )
fi

if [ ! -e $SRC ]; then
  tar xzf $ARCHIVE -C src
fi

if [ ! -f $SRC/programs/sndfile-play.c.orig ]; then
  (
    cd $SRC/programs
    patch
  ) < sndfile-play.c.patch
fi

(
  cd build

  if [ ! -f config.status ]; then
    ../$SRC/configure --prefix=/usr
  fi

  make -j 8
)

make -C build DESTDIR=$PWD/destroot install
