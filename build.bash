#!/bin/bash

RUNNER=${RUNNER:-podman}

"$RUNNER" build -t libfreenect-build .
