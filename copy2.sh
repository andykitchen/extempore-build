#!/bin/bash

# copy extempore into the output directory
# we use install_name_tool to add an executable
# relative rpath

set -e

DEST=usr

mkdir -p usr/bin usr/lib usr/libexec/extempore

cp -v extempore.sh usr/bin/extempore
chmod a+x usr/bin/extempore

cp -v extempore/extempore usr/libexec/extempore/extempore
install_name_tool -add_rpath "@executable_path/../.." usr/libexec/extempore/extempore

cp -r extempore/runtime usr/libexec/extempore
cp -r extempore/libs    usr/libexec/extempore
