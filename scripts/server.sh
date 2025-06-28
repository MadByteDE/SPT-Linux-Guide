#!/bin/bash

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
##       SPT - Server pre-launch script
##                v2025.6-1 
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

readonly ROOT_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
readonly GAMEDIR="${GAMEDIR:-"${ROOT_PATH}"}"

# NOTE: When Flatpak Lutris is used, we don't have access to `dotnet-runtime` and
# `aspnet-runtime` packages on the host system. To work around this limitation,
# we use `flatpak-spawn --host` to launch the server outside of the sandboxed
# environment.
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
