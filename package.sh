#!/bin/bash

set -e

VERSION=`cd extempore && git describe --tags`

tar -s /^usr/extempore/ -lvcjf extempore-$VERSION.tar.bz2 usr
