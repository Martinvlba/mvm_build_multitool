##
# Configurations for android toolchain
##

mvm_meson() {
    # Wrapper for meson
    if [ -z "$@" ]; then
        msg_info "No arguments supplied"
        msg_info "$ mvm_meson -D EXAMPLE=1 ../source_code"
    else
        meson \
        --buildtype=release \
        --cross-file ${MT_BASE_DIR}/developer/cross.txt \
        ${@}
    fi
}
