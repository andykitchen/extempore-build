#!/bin/bash

set -e

SRC=src/rtmidi-c-api

if [ ! -e $SRC ]; then
  git clone https://github.com/benswift/rtmidi-c-api.git $SRC
fi

(
  cd $SRC
  make -f Makefile-osx
)

mkdir -p destroot/usr/lib
cp $SRC/librtmidic.dylib destroot/usr/lib
