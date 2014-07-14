#!/bin/bash

# Copy just the necessary binaries for building into the output directory
# notice we use install_name_tool to set an @rpath based install path
# this will change the way that extempore links with them

set -e

mkdir -p usr/bin usr/include usr/lib

cp -v portaudio/destroot/usr/lib/libportaudio.2.dylib usr/lib
ln -fs libportaudio.2.dylib usr/lib/libportaudio.dylib
install_name_tool -id @rpath/lib/libportaudio.dylib usr/lib/libportaudio.dylib

cp -v pcre/destroot/usr/lib/libpcre.1.dylib usr/lib
ln -fs libpcre.1.dylib usr/lib/libpcre.dylib
install_name_tool -id @rpath/lib/libpcre.dylib usr/lib/libpcre.dylib
