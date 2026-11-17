# check=skip=FromPlatformFlagConstDisallowed

# sarge cannot talk to current HTTPS servers, so fetch the sources here.
FROM --platform=$BUILDPLATFORM debian:trixie AS sources

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        git \
        wget \
        && \
    rm -rf /var/lib/apt/lists/*

ARG GCC_REPO=https://github.com/easybe/gcc.git
ARG GCC_BRANCH=aux
ARG BINUTILS_SHA256=d78a6ff982ab2f73721706e7bfd3285ac647804664e7ea4786e66d01f91c56c5

RUN mkdir /src && \
    git clone --depth 1 --branch "$GCC_BRANCH" "$GCC_REPO" /src/gcc && \
    rm -rf /src/gcc/.git && \
    wget -q -O /tmp/binutils.tar.bz2 \
        https://ftp.gnu.org/gnu/binutils/binutils-2.16.1.tar.bz2 && \
    echo "$BINUTILS_SHA256  /tmp/binutils.tar.bz2" | sha256sum -c - && \
    tar xjf /tmp/binutils.tar.bz2 -C /src && \
    rm /tmp/binutils.tar.bz2

FROM --platform=linux/386 debian/eol:sarge

RUN apt-get update && \
    apt-get install -y \
        bison \
        bison-1.35 \
        bzip2 \
        file \
        flex \
        g++ \
        gcc \
        gcc-2.95 \
        gettext \
        m4 \
        make \
        patch \
        texinfo \
        && \
    rm -rf /var/lib/apt/lists/*

# sysroot holds usr/include, lib and usr/lib of an A/UX installation. The cross compiler keeps its own copy of what it needs.
#
# The 32-bit find of sarge fails on the inode numbers of the image's
# overlay file system, which leaves the A/UX headers unfixed. So build in a
# tmpfs and install to one at the final path, whose contents are copied
# into the image afterwards. The sources are mounted writable, since the
# build patches binutils and generates files in the GCC tree, but none of
# that ends up in the image.
RUN --mount=type=bind,source=sysroot,target=/usr/src/aux-sysroot \
    --mount=type=bind,from=sources,source=/src,target=/usr/src/aux,rw \
    --mount=type=tmpfs,target=/tmp/aux-build \
    --mount=type=tmpfs,target=/opt/aux \
    /usr/src/aux/gcc/contrib/aux/build-cross.sh /usr/src/aux-sysroot \
        /usr/src/aux/binutils-2.16.1 /opt/aux /tmp/aux-build && \
    cp -a /opt/aux /opt/aux.out

RUN rm -rf /opt/aux && \
    mv /opt/aux.out /opt/aux

ENV PATH=/opt/aux/bin:$PATH

CMD ["bash"]
