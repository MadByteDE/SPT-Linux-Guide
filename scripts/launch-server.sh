#!/usr/bin/env bash

# # # # # # # # # # # # # # # # # # # # # # # #
#       SPT - Server pre-launch script        #
#                v2025.10-2                   #
# # # # # # # # # # # # # # # # # # # # # # # #

ROOT_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &>/dev/null && pwd )"
TERMINALS=( "alacritty" "ghostty" "foot" "terminator" "ptyxis" "cosmic-terminal"
            "kgx" "konsole" "gnome-terminal" "xfce4-terminal" "kitty" "xterm" )

# NOTE: When Flatpak Lutris is used, we don't have access to `aspnetcore-runtime`
# packages on the host system. To work around this limitation,
# we use `flatpak-spawn --host` to launch the server outside of the sandboxed
# environment. (not supported with some desktop portals on Wayland e.g. `cinnamon/xapp`)
m_run() {
    if [[ -z "${FLATPAK_SANDBOX_DIR}" ]]; then "$@"
    else flatpak-spawn --host "$@"; fi
}

# Skip launch if another instance is already running
[[ -n $( m_run pidof "SPT.Server.Linux" ) ]] && exit 0

for term in "${TERMINALS[@]}"; do
    if ! m_run command -v $term &>/dev/null; then continue; fi
    cd "${ROOT_PATH}/SPT"
    m_run $term -e "./SPT.Server.Linux"; break
done
