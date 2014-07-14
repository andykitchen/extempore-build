#!/bin/bash

set -e

DEST=usr

ln -fs ../../../llvm/destroot/usr $DEST/libexec/extempore/llvm

export EXT_LLVM_DIR=llvm
cp stdlib.make $DEST/libexec/extempore
make -C $DEST/libexec/extempore -f stdlib.make core

rm $DEST/libexec/extempore/llvm
rm $DEST/libexec/extempore/stdlib.make
