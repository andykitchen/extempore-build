#!/bin/bash

cd `dirname "$BASH_SOURCE"`/..

XTM_HOME=$PWD
export DYLD_LIBRARY_PATH=$XTM_HOME/lib

echo "XTM_HOME=$XTM_HOME"
echo "DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH"

cd libexec/extempore
exec ./extempore "$@"
