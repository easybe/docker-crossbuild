#!/bin/sh
set -e

test $# -lt 2 && echo "Usage: $0 /path/to/linux/src /path/to/container/home" && exit 1

ARCH=arm
TARGET=arm-linux-gnueabihf
CC="ccache $TARGET-gcc"
RUN="docker run --rm -e UID=$(id -u) -e GID=$(id -g) -v $1:/src -v $2:/home/user -w /src easybe/debian-arm-build"
BUILD=/home/user/build

$RUN git config --global --add safe.directory /src
$RUN sh -c "yes \"\" | make O=$BUILD ARCH=$ARCH CROSS_COMPILE=$TARGET- oldconfig"
$RUN sh -c "make -j $(( $(nproc) + 1 )) O=$BUILD ARCH=$ARCH CROSS_COMPILE=$TARGET- CC=\"$CC\" deb-pkg && cp /*.deb ~/"

echo "Done!"
