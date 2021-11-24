FROM ubuntu:20.04

LABEL maintainer "Kyle Williams <kyle.anthony.williams2@gmail.com>"

### STARTUP ###

# No Debian, I don't want to configure my timezone.
ARG DEBIAN_FRONTEND=noninteractive

# Standard apt update
RUN apt update

# Install dependencies
RUN apt install -y libusb-1.0-0-dev \
	cmake \
	build-essential \
	# Python library
	python3 \
	libpython3-all-dev \
	# python3-numpy \
	# python3-distutils \
	# cython3 \
	# OpenGL for examples
	libxmu-dev \
	freeglut3-dev \
	libxi-dev \
	# Download tarball
	curl \
	# Building RPMs
	rpm

# Download and extract release

RUN curl -L 'https://github.com/OpenKinect/libfreenect/archive/refs/tags/v0.6.2.tar.gz' \
	-O

RUN tar xvzf v0.6.2.tar.gz

WORKDIR /libfreenect-0.6.2/

# Build freenect and packages

RUN mkdir build

WORKDIR /libfreenect-0.6.2/build/

RUN cmake .. \
	# Python distribution is buggy
	# -DBUILD_PYTHON3=ON \
	-DBUILD_CPACK_DEB=ON \
	-DBUILD_CPACK_RPM=ON \
	-DBUILD_CPACK_TGZ=ON \
	-DBUILD_REDIST_PACKAGE=OFF

RUN cpack
