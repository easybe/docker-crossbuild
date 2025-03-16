FROM debian:bookworm

COPY sources.list /etc/apt/sources.list

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
        gosu \
        kmod \
        less \
        libelf-dev \
        libssl-dev \
        libssl-dev:arm64 \
        libssl-dev:armhf \
        man \
        python3 \
        python3.11-venv \
        rsync \
        ssh \
        tig \
        vim \
        && \
    rm -rf /var/lib/apt/lists/* && \
    sed -Ei 's/^(UID_MIN[[:space:]]+)[[:digit:]]+$/\1501/' /etc/login.defs

COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD ["bash"]
ENTRYPOINT ["/docker-entrypoint.sh"]
