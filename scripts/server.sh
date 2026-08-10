#!/usr/bin/env bash

# We don't want to run as root
if [[ "$( id -u )" -eq 0 ]]; then
    echo "This script is not supposed to be run as root!" >&2
    exit 1
fi

# Uncomment line below if .NET is installed in your HOME directory
# export DOTNET_ROOT=$HOME/.dotnet

ROOT_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"
TERMINALS=( "alacritty" "ghostty" "foot" "terminator" "ptyxis" "cosmic-terminal"
            "kgx" "konsole" "gnome-terminal" "xfce4-terminal" "kitty" "xterm" )

for term in "${TERMINALS[@]}"; do
    if ! command -v $term &>/dev/null; then continue; fi
    cd "${ROOT_PATH}/SPT_Runtime" || exit 1
    # Check if in interactive mode or not & run the command
    if [ -t 0 ]; then ./SPT.Server.Linux
    else $term -e "./SPT.Server.Linux" >&1; fi
    exit
done

echo "ERROR: Failed to find a terminal emulator" && exit 1
