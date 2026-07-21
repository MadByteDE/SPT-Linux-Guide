#!/usr/bin/env bash

# Set Proton version
export PROTONPATH="${PROTONPATH:-GE-Proton}"

# Set wine prefix
export WINEPREFIX="${WINEPREFIX:-$HOME/Games/tarkov}"

# Add additions runtime directory to path
RUNTIME_PATH="${XDG_DATA_HOME:-${HOME}/.local/share}/spt-additions/runtime"
[[ -d "${RUNTIME_PATH}" ]] && export PATH=$RUNTIME_PATH:$PATH

# Get umu-run path
UMU_PATH=$( command -v umu-run )

if [[ -z "${UMU_PATH}" ]]; then
	echo "Cannot find umu-run executable"
	exit 1
fi

# Environment variables
export PROTON_USE_XALIA=0 PROTON_MEDIA_USE_GST=1
export DOTNET_BUNDLE_EXTRACT_BASE_DIR= DOTNET_ROOT=
export MANGOHUD=0 MANGOHUD_CONFIG=full

# Launch
cd "SPT" && "$UMU_PATH" "SPT.Launcher.exe"
