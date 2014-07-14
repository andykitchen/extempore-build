#!/bin/bash

set -e

git submodule update --init

(
  cd portaudio
  source build.sh
)

(
  cd pcre
  source build.sh
)

(
  cd llvm
  source build.sh
)

source copy1.sh
source build-extempore.sh
source copy2.sh

source build-stdlib.sh
