#!/bin/env bash

if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
    VERSION=$VERSION_ID
    echo "Distribution: $DISTRO"
    echo "Version: $VERSION"
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    DISTRO=$DISTRIB_ID
    VERSION=$DISTRIB_RELEASE
    echo "Distribution: $DISTRO"
    echo "Version: $VERSION"
else
    echo "Unable to determine the Linux distribution."
fi

