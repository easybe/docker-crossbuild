#!/bin/sh
set -e
LINUX_SRC=/home/easyb/src/linux
CC="ccache aarch64-linux-gnu-gcc"
cd $(dirname $0)
RUN="docker run --rm -v $LINUX_SRC:/src -v $PWD/home:/root -v $PWD/build:/build -w /src easybe/debian-arm-build"
[ $# -gt 1 ] && path=$1

mkdir -p home build
$RUN sh -c 'yes "" | make O=/build ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- oldconfig'

if [ "$path" ]; then
    $RUN make O=/build ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CC="$CC" $path
    exit
else
    $RUN make -j $(( $(nproc) + 1 )) O=/build ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CC="$CC" all
    $RUN make O=/build ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CC="$CC" Image
fi
rm -rf home/kernel
mkdir -p home/kernel
cp build/arch/arm64/boot/Image home/kernel/
cp build/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb home/kernel/
$RUN make O=/build ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=/root/kernel modules_install
rm -f kernel.tar.gz
tar -C home -czf kernel.tar.gz kernel