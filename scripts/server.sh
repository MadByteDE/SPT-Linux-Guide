#!/bin/bash
# # Server pre-launch script for Lutris # #

readonly ROOT_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
readonly GAMEDIR="${GAMEDIR:-"${ROOT_PATH}"}"

# NOTE: If a Flatpak version of Lutris is used, we still want to launch the native
# server with the 'dotnet-runtime' and 'aspnet-runtime' packages from the host system.
m_run() {
    if [[ -z "${FLATPAK_SANDBOX_DIR}" ]]; then "$@"
    else flatpak-spawn --host "$@"; fi
}

# Skip launch if another instance is already running
[[ $(m_run pidof "SPT.Server.Linux") != "" ]] && exit 0

cd "${GAMEDIR}"

TERMS=("foot" "alacritty" "ptyxis" "konsole" "gnome-terminal" "xfce4-terminal" "kgx" "kitty" "xterm")
for term in "${TERMS[@]}"; do
    if m_run command -v $term; then
        m_run $term -e "./SPT.Server.Linux"
        break
    fi
done
