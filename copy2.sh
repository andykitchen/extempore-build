#!/bin/bash

set -e

DEST=usr

mkdir -p $DEST/bin $DEST/lib $DEST/libexec/extempore

cp -v extempore.sh $DEST/bin/extempore
chmod a+x $DEST/bin/extempore

cp -v extempore/extempore $DEST/libexec/extempore/extempore
install_name_tool -add_rpath "@executable_path/../.." $DEST/libexec/extempore/extempore

cp -r extempore/runtime $DEST/libexec/extempore
cp -r extempore/libs    $DEST/libexec/extempore
