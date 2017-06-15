#!/bin/bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

USER_ID=${LOCAL_USER_ID:-9001}

echo "Create user with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user

gosu user "$@"
