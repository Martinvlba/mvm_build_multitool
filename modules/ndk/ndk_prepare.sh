ndk_prepare_env() {
    message "Preparing initial android environment"

    mkdir -p ${ANDROID_DEV_ENV}/{ndk,build_tools}
    mkdir -p ${ANDROID_OUT}
}

ndk_download_ndk() {
    message "Downloading NDK"
    wget ${ANDROID_NDK_LINK} -O ${ANDROID_OUT}/ndk-${ANDROID_NDK_VERSION}.zip.partial_download
    mv ${ANDROID_OUT}/ndk-$ANDROID_NDK_VERSION.zip.partial_download ${ANDROID_OUT}/ndk-$ANDROID_NDK_VERSION.zip
}

ndk_download_sdk() {
    message "Downloading SDK"
    wget ${ANDROID_SDK_BUILD_TOOL_LINK} -O ${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip.partial_download
    mv ${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip.partial_download ${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip
}

ndk_install_ndk() {
    ndk_zip="${ANDROID_OUT}/ndk-$ANDROID_NDK_VERSION.zip"

    message "Unzipping NDK"
    unzip -q $ndk_zip -d ${ANDROID_NDK}
}

ndk_install_sdk() {
    bldt_zip="${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip"

    message "Unzipping Build Tools"
    unzip -q $bldt_zip -d ${ANDROID_BUILD_TOOL}
}

ndk_setup_rootfs() {

}

ndk_health_check() {
    message "Checking android NDK"

    ndk_prepare_env

    if [ -f ${ANDROID_DEV_ENV}/ndk/ndk-build ]; then
        message "NDK found"
    else
        ndk_download_ndk
        ndk_install_ndk
    fi

    message "Checking android SDK"
    if [ -f ${ANDROID_DEV_ENV}/build_tools/apksigner ]; then
        message "SDK found"
    else
        ndk_download_sdk
        ndk_install_sdk
    fi

    #       ${ANDROID_RAW_SYSROOT}
    message "Re-creating sysroot"
    mkdir -p ${ANDROID_SYSROOT}/lib

    # Copy includes
    cp -rf ${ANDROID_RAW_SYSROOT}/include ${ANDROID_SYSROOT}

    # Create proper lib structure
    cp -rf ${ANDROID_RAW_SYSROOT}/lib/aarch64-linux-android/*.a ${ANDROID_SYSROOT}/lib/
    cp -rf ${ANDROID_RAW_SYSROOT}/lib/aarch64-linux-android/*.o ${ANDROID_SYSROOT}/lib/
    cp -rf ${ANDROID_RAW_SYSROOT}/lib/aarch64-linux-android/*.so ${ANDROID_SYSROOT}/lib/
    cp -rf ${ANDROID_RAW_SYSROOT}/lib/aarch64-linux-android/${ANDROID_TARGET_API}/* ${ANDROID_SYSROOT}/lib/
}
