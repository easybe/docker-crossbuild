FROM debian:buster

ADD sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential bison flex fakeroot bc kmod \
        cpio libssl-dev man less tig ssh ca-certificates vim cscope ccache \
        gdb-doc rsync libncurses-dev file wget unzip && \
    rm -rf /var/lib/apt/lists/*
