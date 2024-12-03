FROM debian:bookworm

ADD sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bc \
        bison \
        build-essential \
        ca-certificates \
        ccache \
        cpio \
        crossbuild-essential-armhf \
        cscope \
        fakeroot \
        flex \
        gdb-arm-none-eabi \
        gdb-doc \
        kmod \
        less \
        libssl-dev \
        man \
        ssh \
        tig \
        vim \
        && \
    rm -rf /var/lib/apt/lists/*
