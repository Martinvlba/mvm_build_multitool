##
# Prepare and check for ndk/sdk
##

ndk_prepare_env() {
    message "Preparing initial android environment"

    mkdir -p ${ANDROID_DEV_ENV}/{ndk,build_tools,tmp}
    mkdir -p ${ANDROID_OUT}
}

ndk_download_ndk() {
    message "Downloading NDK"
    if [ ! -f ${ANDROID_OUT}/ndk-$ANDROID_NDK_VERSION.zip ]; then
        wget ${ANDROID_NDK_LINK} -O ${ANDROID_OUT}/ndk-${ANDROID_NDK_VERSION}.zip.partial_download
        mv ${ANDROID_OUT}/ndk-$ANDROID_NDK_VERSION.zip.partial_download ${ANDROID_OUT}/ndk-$ANDROID_NDK_VERSION.zip
    fi
}

ndk_download_sdk() {
    message "Downloading SDK"
    if [ ! -f ${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip ]; then
        wget ${ANDROID_SDK_BUILD_TOOL_LINK} -O ${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip.partial_download
        mv ${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip.partial_download ${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip
    fi
}

ndk_install_ndk() {
    ndk_zip="${ANDROID_OUT}/ndk-$ANDROID_NDK_VERSION.zip"

    message "Unzipping NDK"
    unzip -q $ndk_zip -d ${ANDROID_DEV_ENV}/tmp

    cp -rf ${ANDROID_DEV_ENV}/tmp/android-ndk-r${ANDROID_NDK_VERSION}/* ${ANDROID_NDK}
    rm -rf ${ANDROID_DEV_ENV}/tmp/android-ndk-r${ANDROID_NDK_VERSION}
}

ndk_install_sdk() {
    bldt_zip="${ANDROID_OUT}/build_tools-${ANDROID_SDK_BUILD_TOOL_VERSION}.zip"

    message "Unzipping Build Tools"
    unzip -q $bldt_zip -d ${ANDROID_DEV_ENV}/tmp

    cp -rf ${ANDROID_DEV_ENV}/tmp/android-${ANDROID_VERSION}/* ${ANDROID_BUILD_TOOL}
    rm -rf ${ANDROID_DEV_ENV}/tmp/android-${ANDROID_VERSION}
}

ndk_setup_sysroot() {
    message "Re-creating sysroot"
    mkdir -p ${ANDROID_SYSROOT}/{lib,etc}

    cp -f ${MT_BASE_DIR}/developer/cross_android.cmake ${ANDROID_SYSROOT}/etc/cross_android.cmake
    sed -i "s/REPLACEME/${ANDROID_ROOTFS}/g" ${ANDROID_SYSROOT}/etc/cross_android.cmake

    # Copy includes
    cp -rf ${ANDROID_RAW_SYSROOT}/include ${ANDROID_SYSROOT}

    # Create proper lib structure
    cp -rf ${ANDROID_RAW_SYSROOT}/lib/aarch64-linux-android/*.a ${ANDROID_SYSROOT}/lib/
    cp -rf ${ANDROID_RAW_SYSROOT}/lib/aarch64-linux-android/*.o ${ANDROID_SYSROOT}/lib/
    cp -rf ${ANDROID_RAW_SYSROOT}/lib/aarch64-linux-android/*.so ${ANDROID_SYSROOT}/lib/
    cp -rf ${ANDROID_RAW_SYSROOT}/lib/aarch64-linux-android/${ANDROID_TARGET_API}/* ${ANDROID_SYSROOT}/lib/

    # Additional changes for include
    cp -rf ${ANDROID_SYSROOT}/include/aarch64-linux-android/asm ${ANDROID_RAW_SYSROOT}/include
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

    ndk_setup_sysroot

    message "Android dev env has been set up"
}
