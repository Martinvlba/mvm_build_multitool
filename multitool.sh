#!/usr/bin/env bash

set -e -o pipefail -u

if [ -f build/multitool.sh ];then
    echo "[+]: Loading multitool..."
else
    echo "[!]: This script has been ran incorrectly..."
    echo "[!]: Try: source build/multitool.sh"
    exit 1
fi

# Load inital exports and functions
export MT_BASE_DIR="$(pwd)/build/multitool"
export MT_MVM_BASE="$(pwd)"

source $MT_BASE_DIR/modules/global_exports.sh
source $MT_BASE_DIR/modules/other/message_types.sh

# Load everything else by loader
source $MT_BASE_DIR/env/load_scripts.sh

spawn_ie
