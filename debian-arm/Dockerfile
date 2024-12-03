FROM debian:bookworm

ADD sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential crossbuild-essential-armhf bison flex fakeroot bc kmod \
        cpio libssl-dev man less tig ssh ca-certificates vim cscope ccache \
        gdb-arm-none-eabi gdb-doc && \
    rm -rf /var/lib/apt/lists/*
