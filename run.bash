#!/bin/bash

RUNNER=${RUNNER:-podman}
NAME=${NAME:-libfreenect}

"$RUNNER" run -it --name "$NAME" --replace libfreenect-build
