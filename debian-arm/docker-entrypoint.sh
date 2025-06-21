#!/bin/sh

USER_ID=${UID:-1000}
GROUP_ID=${GID:-1000}

getent group user >/dev/null || groupadd -g "$GROUP_ID" -o user
id user >/dev/null 2>&1 || \
    useradd -s /bin/bash -u "$USER_ID" -g user -G sudo -o -d /home/user user && \
    echo "%sudo	ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/user && \
    chmod 440 /etc/sudoers.d/user

exec gosu user "$@"
