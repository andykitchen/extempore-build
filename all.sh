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

source copy-prebuild.sh
source build-extempore.sh
source copy-postbuild.sh

source build-stdlib.sh

(
  cd external
  source all.sh
)

source copy-external.sh
source build-stdlib-external.sh
