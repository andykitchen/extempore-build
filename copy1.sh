#!/bin/bash

set -e

DEST=usr

mkdir -p $DEST/bin $DEST/include $DEST/lib

cp -v portaudio/destroot/usr/lib/libportaudio.2.dylib $DEST/lib
ln -fs libportaudio.2.dylib $DEST/lib/libportaudio.dylib
install_name_tool -id @rpath/lib/libportaudio.dylib $DEST/lib/libportaudio.dylib

cp -v pcre/destroot/usr/lib/libpcre.1.dylib $DEST/lib
ln -fs libpcre.1.dylib $DEST/lib/libpcre.dylib
install_name_tool -id @rpath/lib/libpcre.dylib $DEST/lib/libpcre.dylib
