##
# Configurations for android toolchain
##

mvm_meson() {
    # Wrapper for meson
    if [ -z "$@" ]; then
        msg_info 'No arguments supplied'
        msg_info '$ mvm_meson -D EXAMPLE=1 ../source_code'
    else
        meson \
        --buildtype=release \
        --cross-file ${MT_BASE_DIR}/developer/cross_android.conf \
        ${@}
    fi
}

mvm_cmake() {
    # Wrapper for cmake
    if [ -z "$@" ]; then
        msg_info 'No arguments supplied'
        msg_info '$ mvm_cmake --example=enable ../source_code'
    else
        cmake \
        -D CMAKE_TOOLCHAIN_FILE=${ANDROID_SYSROOT}/etc/cross_android.cmake \
        ${@}
    fi
}

mvm_configure() {
    # Wrapper for configure
    if [ -z "$@" ]; then
        msg_info 'No src-name or arguments supplied'
        msg_info '$ mvm_configure "packagename" "--enable-static --enable-libsomething"'
    else
        mkdir -p ${MVM_OUT}/$1

        cd ${MVM_OUT}/$1
        ${MVM_SOURCE}/$1/configure \
        --host aarch64-linux-android \
        --prefix=${ANDROID_ROOTFS} \
        ${2}
    fi
}
