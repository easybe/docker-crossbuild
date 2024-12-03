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
        crossbuild-essential-arm64 \
        crossbuild-essential-armhf \
        cscope \
        fakeroot \
        flex \
        gdb-doc \
        gdb-multiarch \
        kmod \
        less \
        libssl-dev \
        man \
        ssh \
        tig \
        vim \
        && \
    rm -rf /var/lib/apt/lists/*
