FROM debian:buster

ADD sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential crossbuild-essential-armhf bison flex fakeroot bc kmod \
        cpio libssl-dev man less tig vim cscope ccache gdb-arm-none-eabi && \
    rm -rf /var/lib/apt/lists/*
