#!/bin/bash

set -e

mkdir -p distfiles src build destroot

ARCHIVE=distfiles/pa_stable_v19_20140130.tgz
SRC=src/portaudio

if [ ! -f $ARCHIVE ]; then
  (
    cd distfiles
    wget http://www.portaudio.com/archives/pa_stable_v19_20140130.tgz
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
