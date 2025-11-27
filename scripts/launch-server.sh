#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # #
#       SPT - Server pre-launch script        #
#                v2025.11-2                   #
# # # # # # # # # # # # # # # # # # # # # # # #

# Uncomment line below if you installed ASP.NET in your home directory
# export DOTNET_ROOT=$HOME/.dotnet
ROOT_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"
TERMINALS=( "alacritty" "ghostty" "foot" "terminator" "ptyxis" "cosmic-terminal"
            "kgx" "konsole" "gnome-terminal" "xfce4-terminal" "kitty" "xterm" )

err() {
    local msg="${1}"  status=${2:-1}
    if [[ status != 0 ]]; then
        echo "ERROR: $msg (Exit code: $status)"
        exit $status
    fi
}

# NOTE: `aspnetcore-runtime` on the host system is not available from a sandboxed environment.
# Theirfore we use `flatpak-spawn --host` to launch the server on the host system.
# This might not work with some Wayland desktop portals e.g. `cinnamon/xapp`
m_run() {
    if [[ -z "${FLATPAK_SANDBOX_DIR}" ]]; then "$@"
    else flatpak-spawn --host "$@" || err "Command \"flatpak-spawn --host $@\" failed"; fi
}

if [[ -n $( m_run pidof "SPT.Server.Linux" ) ]]; then
    err "Another instance of the server is already running"
fi

for term in "${TERMINALS[@]}"; do
    if ! m_run command -v $term &>/dev/null; then continue; fi
    cd "${ROOT_PATH}/SPT"
    m_run $term -e "./SPT.Server.Linux" || err "Failed to run \"SPT.Server.Linux\""
    exit
done

err "Failed to find a terminal emulator"
