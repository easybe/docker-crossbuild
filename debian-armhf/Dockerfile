FROM debian:buster

RUN echo "deb-src http://httpredir.debian.org/debian stable main" \
        >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential crossbuild-essential-armhf bison flex fakeroot bc kmod \
        cpio libssl-dev less tig vim cscope ccache gdb-arm-none-eabi && \
    rm -rf /var/lib/apt/lists/*
