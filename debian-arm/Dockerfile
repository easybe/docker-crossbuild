FROM debian:bookworm

ADD sources.list /etc/apt/sources.list

RUN dpkg --add-architecture arm64 && \
    dpkg --add-architecture armhf && \
    apt-get update && \
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
        debhelper-compat \
        fakeroot \
        flex \
        gdb-doc \
        gdb-multiarch \
        kmod \
        less \
        libelf-dev \
        libssl-dev \
        libssl-dev:arm64 \
        libssl-dev:armhf \
        man \
        python3 \
        rsync \
        ssh \
        tig \
        vim \
        && \
    rm -rf /var/lib/apt/lists/*
