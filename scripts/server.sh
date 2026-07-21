#!/usr/bin/env bash

# Uncomment line below if .NET is installed in your HOME directory
# export DOTNET_ROOT=$HOME/.dotnet

TERMINALS=( "alacritty" "ghostty" "foot" "terminator" "ptyxis" "cosmic-terminal"
            "kgx" "konsole" "gnome-terminal" "xfce4-terminal" "kitty" "xterm" )

if [[ -n $( pidof "SPT.Server.Linux" ) ]]; then
    echo "ERROR: Another instance of the server is already running"
    exit 1
fi

for term in "${TERMINALS[@]}"; do
    if ! command -v $term &>/dev/null; then continue; fi
    cd "SPT" || exit 1
    $term -e "./SPT.Server.Linux"
    exit
done

echo "ERROR: Failed to find a terminal emulator"
exit 1