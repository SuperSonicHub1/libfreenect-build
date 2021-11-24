#!/bin/bash

RUNNER=${RUNNER:-podman}
NAME=${NAME:-libfreenect}
DIR=${DIR:-"$PWD"}

"$RUNNER" cp "$NAME:/libfreenect-0.6.2/build/libfreenect-dev-0.6-x86_64.deb" "$DIR"
"$RUNNER" cp "$NAME:/libfreenect-0.6.2/build/libfreenect-dev-0.6-x86_64.rpm" "$DIR"
"$RUNNER" cp "$NAME:/libfreenect-0.6.2/build/libfreenect-dev-0.6-x86_64.tar.gz" "$DIR"
