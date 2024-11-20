#!/usr/bin/env bash

# Use strict bash settings
set -euo pipefail
IFS=$'\n\t'

# Get directory holding this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
echo "Setting up app in $SCRIPT_DIR"

VENV_DIR="${SCRIPT_DIR}/.venv"

# Create virtualenv
if [ -d "${VENV_DIR}" ]; then
    echo "Virtualenv already exists!"
else
    echo "Creating virtualenv..."
    python3 -m venv "${VENV_DIR}"
fi

# Activate virtualenv
source "${VENV_DIR}/bin/activate"

# Upgrade pip in virtualenv
pip install --upgrade pip

# Install deps
pip install -r "${SCRIPT_DIR}/requirements.txt"

# Set up database
sqlite3 honor.db <db/createdb-sqlite.sql
