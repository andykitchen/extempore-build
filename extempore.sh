#!/bin/bash

cd `dirname "$BASH_SOURCE"`/../libexec/extempore
exec ./extempore "$@"
