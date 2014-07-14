#!/bin/bash

set -e

mkdir -p distfiles src build destroot

ARCHIVE=distfiles/llvm-3.4.2.src.tar.gz
SRC=src/`basename ${ARCHIVE} .tar.gz`

if [ ! -f $ARCHIVE ]; then
  (
    cd distfiles
    wget http://llvm.org/releases/3.4.2/llvm-3.4.2.src.tar.gz
  )
fi

if [ ! -e $SRC ]; then
  tar xzf $ARCHIVE -C src
fi

(
  cd $SRC/lib/AsmParser

  if [ ! -f LLParser.cpp.orig ]; then
    cp LLParser.cpp LLParser.cpp.orig
    patch
  fi
) < ../extempore/extras/llparser.patch

(
  cd build

  if [ ! -f config.status ]; then
    ../$SRC/configure --prefix=/usr --enable-optimized
  fi

  make -j 8
)

make -C build DESTDIR=$PWD/destroot install
