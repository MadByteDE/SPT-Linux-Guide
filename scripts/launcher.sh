#!/usr/bin/env bash

# We don't want to run as root
if [[ "$( id -u )" -eq 0 ]]; then
    echo "This script is not supposed to be run as root!" >&2
    exit 1
fi

########################
# Environment variables
########################

# Set Proton version
export PROTONPATH="${PROTONPATH:-"GE-Proton"}"

# Set wine prefix
export WINEPREFIX="${WINEPREFIX:-"$HOME/Games/escape-from-tarkov"}"

# Environment variables
export DOTNET_ROOT=
export DOTNET_BUNDLE_EXTRACT_BASE_DIR=
export PROTON_USE_XALIA="${PROTON_USE_XALIA:-0}"
export PROTON_MEDIA_USE_GST="${PROTON_MEDIA_USE_GST:-1}"
#export MANGOHUD=1  MANGOHUD_CONFIG=full


########################
# Prepare umu runtime
########################

# Add additions runtime directory to path
RUNTIME_PATH="${XDG_DATA_HOME:-${HOME}/.local/share}/spt-additions/runtime"
[[ -d "${RUNTIME_PATH}" ]] && export PATH=$RUNTIME_PATH:$PATH

if [[ -z $( command -v umu-run 2>/dev/null ) ]]; then
	echo "ERROR: Cannot find umu-run executable"
	exit 1
fi


########################
# Launch
########################

cd "SPT" && umu-run "SPT.Launcher.exe"
