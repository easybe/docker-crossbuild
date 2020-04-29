FROM debian:buster

RUN echo "deb-src http://httpredir.debian.org/debian stable main" \
        >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential crossbuild-essential-armhf bison flex fakeroot bc kmod \
        cpio libssl-dev tig vim cscope ccache && \
    rm -rf /var/lib/apt/lists/*
