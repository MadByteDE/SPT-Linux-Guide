#!/usr/bin/env bash

# We don't want to run as root
if [[ "$( id -u )" -eq 0 ]]; then
    echo "This script is not supposed to be run as root!" >&2
    exit 1
fi

cd "SPT_Runtime" && ./SPT.Launcher.Linux
