#!/bin/bash

# Copy just the necessary binaries for building into the output directory
# notice we use install_name_tool to set an @rpath based install path
# this will change the way that extempore links with them

set -e

mkdir -p usr/bin usr/include usr/lib

cp -v external/kiss_fft/destroot/usr/lib/kiss_fft.1.3.0.dylib usr/lib
ln -fs kiss_fft.1.3.0.dylib usr/lib/kiss_fft.dylib
install_name_tool -id @rpath/lib/kiss_fft.dylib usr/lib/kiss_fft.dylib

cp -v external/libsndfile/destroot/usr/lib/libsndfile.1.dylib usr/lib
ln -fs libsndfile.1.dylib usr/lib/libsndfile.dylib
install_name_tool -id @rpath/lib/libsndfile.dylib usr/lib/libsndfile.dylib

cp -v external/rtmidi/destroot/usr/lib/librtmidi.2.1.0.dylib usr/lib
ln -fs librtmidi.2.1.0.dylib usr/lib/librtmidi.dylib
install_name_tool -id @rpath/lib/librtmidi.dylib usr/lib/librtmidi.dylib

cp -v external/rtmidi-c-api/destroot/usr/lib/librtmidic.dylib usr/lib
install_name_tool -id @rpath/lib/librtmidic.dylib usr/lib/librtmidic.dylib
