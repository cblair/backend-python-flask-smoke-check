#!/usr/bin/env bash

# Use strict bash settings
set -euo pipefail

# Get directory holding this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

VENV_DIR="${SCRIPT_DIR}/.venv"

echo "checking if virtualenv is activated..."
if [ "${VIRTUAL_ENV:=}" = "${VENV_DIR}" ]; then
    echo "virtualenv is activated."
else
    echo "virtualenv is NOT activated. activating..."
    # shellcheck source=/dev/null
    source "${VENV_DIR}/bin/activate" || (echo 'virtualenv could not be activated.  Make sure you have run setup.sh' && exit 1)
fi

echo "starting server in $SCRIPT_DIR"
cd "$SCRIPT_DIR"
flask --debug --app honor/app run --port 8080
