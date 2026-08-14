#!/usr/bin/env bash

CACHE_DIR="${HOME}/.cache/spt-additions"
RUNTIME_DIR="${HOME}/.local/share/spt-additions/runtime"
FILES_DIR="${CACHE_DIR}/files"
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" && pwd )"
METADATA_PATH="${SCRIPT_DIR}/metadata.conf"
SCRIPT_PATH="${SCRIPT_DIR}/spt-additions"
INSTALLER_PATH="$( realpath -m "../installers" )"
export PATH="$PATH:${RUNTIME_DIR}"

msg() { echo -e "│ $*"; }
err() { echo -e "│ ${BOLD}${RED}Err:${RESET} $*" >&2; exit 1; }
get_hash() { md5sum "$@" | cut -d ' ' -f 1 | xxd -r -p | base64 2>/dev/null; }

replace_value() {
    local key="${1}"
    local value="${2}"
    local file_path="${3}"
    [[ -z "${key}" || -z "${value}" ]] && return 1
    sed -i -E "s|^(${key}=).*|\1\"${value}\"|g" "${file_path}" || return 1
}

main() {
    local script_version="${1}"
    local date_str=$( date +"%Y-%m-%d" )

    msg "Script path: ${SCRIPT_PATH}"

    [[ ! -d "${FILES_DIR}" ]] && mkdir -p "${FILES_DIR}"

    if [[ -n "${script_version}" ]]; then
        # Update additions version
        msg "Updating version to \"${script_version}\"..."
        replace_value "VERSION" "${script_version}" "${SCRIPT_PATH}" || err "Failed to update version"

        # Update release date
        msg "Updating date to \"${date_str}\"..."
        replace_value "DATE" "${date_str}" "${SCRIPT_PATH}" || err "Failed to update date"

        # Update additions hash
        msg "Updating additions hash..."
        local additions_hash=$( get_hash "${SCRIPT_PATH}" ) || err "Failed to calculate additions hash"
        replace_value "additions-hash" "${additions_hash}" "${METADATA_PATH}" || err "Failed to update additions hash"

        # Find and replace branch
        if [[ "${script_version}" == *"-dev"* ]]; then
            local matchstr='s*SPT-Linux-Guide/main*SPT-Linux-Guide/SPTv41-Dev*g'
            msg "Replacing branch: main -> SPTv41-Dev ..."
            sed -i $matchstr "${METADATA_PATH}"
            sed -i $matchstr "${SCRIPT_PATH}"
        else
            local matchstr='s*SPT-Linux-Guide/SPTv41-Dev*SPT-Linux-Guide/main*g'
            msg "Replacing branch: SPTv41-Dev -> main ..."
            sed -i $matchstr "${METADATA_PATH}"
            sed -i $matchstr "${SCRIPT_PATH}"
        fi
    fi

    # Copy latest metadata file to cache directory
    [[ ! -d "${CACHE_DIR}/metadata" ]] && mkdir -p "${CACHE_DIR}/metadata"
    cp -f ./metadata.conf "${CACHE_DIR}/metadata/metadata.conf"
}

main "$@"