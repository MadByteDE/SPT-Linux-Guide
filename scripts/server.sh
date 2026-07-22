#!/usr/bin/env bash

# Uncomment line below if .NET is installed in your HOME directory
# export DOTNET_ROOT=$HOME/.dotnet

ROOT_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"
TERMINALS=( "alacritty" "ghostty" "foot" "terminator" "ptyxis" "cosmic-terminal"
            "kgx" "konsole" "gnome-terminal" "xfce4-terminal" "kitty" "xterm" )

m_run() {
    if [[ -z "${FLATPAK_SANDBOX_DIR}" ]]; then "$@"
    else flatpak-spawn --host "$@" || exit 1; fi
}

if [[ -n $( m_run pidof "SPT.Server.Linux" ) ]]; then
    echo "ERROR: Another instance is already running"; exit 1
fi

for term in "${TERMINALS[@]}"; do
    if ! m_run command -v $term &>/dev/null; then continue; fi
    cd "${ROOT_PATH}/SPT" || exit 1
    m_run $term -e "./SPT.Server.Linux"
    exit
done

echo "ERROR: Failed to find a terminal emulator"; exit 1
