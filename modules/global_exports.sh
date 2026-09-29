##
# Global exports
# MT - MultiTool
# IE - Interactive Environment
##

export MT_VERSION=0.0.0.0.1 # Versioning
export MT_IS_IE=false # By default false
export MT_DEV_FOLDER=$MT_MVM_BASE/developer
export MVM_OUT=${MT_MVM_BASE}

##
# ANDROID SPECIFIC
##

export ANDROID_ROOTFS=$MVM_OUT/out/rootfs

# Target API ( Always keep it MVM min api level, only bump if app min level has changed! )
export ANDROID_TARGET_API=35
export ANDROID_VERSION=15

# Misc links and paths for toolset
export ANDROID_OUT=${MT_MVM_BASE}/out/android
export ANDROID_DEV_ENV=${MT_MVM_BASE}/developer/android
export ANDROID_SDK=${ANDROID_DEV_ENV}/sdk
export ANDROID_NDK=${ANDROID_DEV_ENV}/ndk
export ANDROID_RAW_SYSROOT=${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/
export ANDROID_SYSROOT=${ANDROID_DEV_ENV}/sysroot
export ANDROID_BUILD_TOOL=${ANDROID_DEV_ENV}/build_tools
export ANDROID_REPO=https://dl.google.com/android/repository

# NDK 30.0.16248370
export ANDROID_NDK_VERSION=30
export ANDROID_NDK_FILE="android-ndk-r${ANDROID_NDK_VERSION}-linux.zip"
export ANDROID_NDK_LINK="${ANDROID_REPO}/${ANDROID_NDK_FILE}"

# SDK
export ANDROID_SDK_BUILD_TOOL_VERSION=35.0.1
export ANDROID_SDK_BUILD_TOOL_FILE="build-tools_r${ANDROID_SDK_BUILD_TOOL_VERSION}-linux.zip"
export ANDROID_SDK_BUILD_TOOL_LINK="${ANDROID_REPO}/${ANDROID_SDK_BUILD_TOOL_FILE}"
