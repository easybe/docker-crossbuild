
# Docker Crossbuild

Cross compilation/development Docker images for Embedded Linux.

## Cross compiling for ARM

### Running a one-off command

    docker run --rm -v $PWD:/src -w /src easybe/debian-arm-build \
        make CROSS_COMPILE=aarch64-linux-gnu- ...

### Using a long-living container

    docker run -d -v $PWD:/src -w /src --name arm-build easybe/debian-arm-build \
        bash -c "trap 'exit 0' SIGTERM; while :; do sleep 1; done"
    docker exec -it arm-build bash

### Building a Linux kernel Debian package (for ARM32)

    mkdir -p home/build
    cp /path/to/config home/build/.config
    scripts/deb_kernel.sh ~/src/linux ./home
    ls -l home/*.deb
