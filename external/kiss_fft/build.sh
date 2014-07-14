#!/bin/bash

set -e

mkdir -p src

SRC=src/kiss_fft

if [ ! -e $SRC ]; then
  git clone https://github.com/benswift/kiss_fft.git $SRC
fi

make -C $SRC shared

mkdir -p destroot/usr/lib
cp $SRC/*.dylib destroot/usr/lib
