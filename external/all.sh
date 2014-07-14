#!/bin/bash

set -e

(
  cd kiss_fft
  source build.sh
)

(
  cd libsndfile
  source build.sh
)

(
  cd rtmidi
  source build.sh
)
