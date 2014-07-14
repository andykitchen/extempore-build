#!/bin/bash

set -e

git submodule update --init

(
  cd extempore

  export CPPFLAGS="-I../portaudio/destroot/usr/include -I../pcre/destroot/usr/include"
  export LDFLAGS="-L../usr/lib"
  export EXT_LLVM_DIR="../llvm/destroot/usr"

  ./all.bash
)
